//
//  NewViewCategory.swift
//  courseproject
//
//  Created by Алексей Суровцев on 13.11.2023.
//

import Foundation
import UIKit

class NewViewCategory: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chego", for: indexPath) as! NewCellController
        cell.configure(with: "aboba")
        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let myNib = UINib(nibName: "NewCell", bundle: nil)
        self.collectionView.register(myNib, forCellWithReuseIdentifier: "chego")
    }
    
    
    
}
