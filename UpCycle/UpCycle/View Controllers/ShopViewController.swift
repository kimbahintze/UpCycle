//
//  ShopViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var shoppingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCollectionView.delegate = self
        shoppingCollectionView.dataSource = self
        navigationController?.isNavigationBarHidden = false
        navigationItem.titleView = logoTitleView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShoppingListMC.shoppingListItems.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shoppingCollectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCell", for: indexPath) as! ShoppingItemCollectionViewCell
        let shoppingItem = ShoppingListMC.shoppingListItems[indexPath.row]
        cell.itemNameLabel.text = shoppingItem.name
        let shoppingImage = UIImage(named: shoppingItem.picture)
        cell.itemImageThumbnail.image = shoppingImage
        cell.itemNameLabel.font = UIFont(name: "Montserrat-Medium", size: 11)
        cell.itemNameLabel.textAlignment = .center
        cell.itemImageThumbnail.contentMode = .scaleAspectFit
        cell.itemImageThumbnail.clipsToBounds = true
        cell.itemImageThumbnail.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let shoppingItem = ShoppingListMC.shoppingListItems[indexPath.row]
        let shoppingURL = URL(string: shoppingItem.UrlAsString)
        UIApplication.shared.open(shoppingURL!, options: [:], completionHandler: nil)
    }
}
