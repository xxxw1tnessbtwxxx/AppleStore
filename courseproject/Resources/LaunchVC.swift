//
//  LaunchVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 12.10.2023.
//

import Foundation
import UIKit
import Alamofire

class LaunchScreen: UIViewController {
    
    @IBOutlet weak var launchFact: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }
    
    private var responseResult: String = ""
    
    private func makeRequest() {
        AF.request("https://catfact.ninja/fact").response { response in
            guard let data = response.data else {
                return
            }
            let catFact = try? JSONDecoder().decode(CatFact.self, from: data)
            self.responseResult = catFact!.fact
        }
        
        DispatchQueue.main.async {
            self.launchFact.text = self.responseResult
        }
        
    }
    
}
