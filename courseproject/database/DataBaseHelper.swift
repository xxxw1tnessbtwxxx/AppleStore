//
//  DBService.swift
//  courseproject
//
//  Created by Алексей Суровцев on 13.10.2023.
//

import Foundation
import SQLite
import UIKit
final class DataBaseHelper {
    
    static let shared = DataBaseHelper()
    let db = try? Connection("/Users/w1tnessbtw/Dev/Swift/AppleStore/courseproject/Store.db")
    
    
    func isFieldFilled(from: UIViewController, for login: String) -> Bool {
        if let _ = try? db!.scalar("SELECT livingAddress, postname FROM users WHERE login = '\(login)'") {
            return true
        }
        
        AlertsCreator.MakePrimitiveAlert(vc: from, title: "Oops...", message: "You have empty living Address and Postcode.\nFill it in Profile Page", buttonTitle: "OK!")
        return false
    }
    
    /// Returns true if login exists in DataBase
    func isLoginExists(login: String) -> Bool {
        let query = "SELECT login FROM users WHERE login = '\(login)'"
        let login = try? db?.scalar(query)
        if let _ = login {
            return true
        }
        return false
    }
    
    
    private func getLogin(login: String) -> Any {
    
        return 0
    }
    
    func loadUserInformation() -> User {
        
        let login = UserDefaultsHelper.shared.loadLogin()
        var user = User(name: "Did not setted", surname: "Did not setted", livingAddress: "Did not setted", postname: "Did not setted")
        let name = try? db?.scalar("SELECT name FROM users WHERE login = '\(login)'")
        let surname = try? db?.scalar("SELECT surname FROM users WHERE login = '\(login)'")
        let livingAddress = try? db?.scalar("SELECT livingAddress FROM users WHERE login = '\(login)'")
        let postname = try? db?.scalar("SELECT postname FROM users WHERE login = '\(login)'")
        if (name != nil) && (surname != nil) && (livingAddress != nil) && (postname != nil) {
            return User(name: name as! String, surname: surname as! String, livingAddress: livingAddress as! String, postname: postname as! String)
        }
        
        return user
        
    }
    
    
    func getOrders(user: String) -> [OrderList] {
        var list: [OrderList] = []
        let id = try? db?.scalar("SELECT id FROM users WHERE login = '\(user)'")
        let stmt = try? db!.prepare("SELECT orderItem, cost, count FROM orders WHERE clientID = '\(id!)'")
        
        for row in stmt! {
            
        }
        
        return list
        
    }
    
    /// Function for create order
    func createOrder(for vc: UIViewController, _ user: String, data: String...) {
        let id = try? db!.scalar("SELECT id FROM users WHERE login = '\(user)'")
        
        let query = "INSERT INTO orders VALUES ('\(id!)', '\(data[0])', '\(data[1])', '\(data[2])',"
        do {
            try db!.run(query)
        }
        catch {
            print(error)
        }
        
    }
    
    func updateProfileInfo(set data: String...) -> Bool {
        let currentLogin = UserDefaults.standard.object(forKey: "currentLogin")!
        let query = "UPDATE users SET name = '\(data[0])', surname = '\(data[1])', livingAddress = '\(data[2])', postname = '\(data[3])' WHERE login = '\(currentLogin)'"
        do {
            try db?.run(query)
            return true
        }
        catch {
            print(error)
            return false
        }
    }
    
    func getPasswordByLogin(loginForCheck: String) -> String {
        var password: String = ""
        let query = try? db?.prepare("SELECT password FROM users WHERE login = '\(loginForCheck)'")
        for row in query! {
            password = row[0] as! String
        }
        return password
    }
    
    func registerUser(from viewcontroller: UIViewController, login: String, password: String, email: String?) {
        
        if isLoginExists(login: login) {
            AlertsCreator.MakePrimitiveAlert(vc: viewcontroller, title: "Error!", message: "This login exists", buttonTitle: "Retry")
            return
        }
        
        let usersTable = Table("users")
        let loginColumn = Expression<String>("login")
        let passwordColumn = Expression<String>("password")
        let emailColumn = Expression<String>("email")
        
        if email == nil {
            let statement = usersTable.insert(loginColumn <- login, passwordColumn <- password)
            do {
                try db?.run(statement)
            }
            catch {
                print(error)
            }
        }
        else {
            let statement = usersTable.insert(emailColumn <- email!, loginColumn <- login, passwordColumn <- password)
            do {
                try db?.run(statement)
            }
            catch {
                print(error)
            }
        }
    }
    
    func validateLogin(login: String, password: String) -> Bool {
        
        var logins: [String] = []
        let stmt = try? db?.prepare("SELECT login FROM users")
        for row in stmt! {
            logins.append(row[0] as! String)
        }
        if logins.contains(login) {
            if (password == getPasswordByLogin(loginForCheck: login)) {
                return true
            }
        }
        return false
    }
    
    
}
