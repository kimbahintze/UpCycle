//
//  ShoppingItemCollectionViewCell.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/19/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingList? 
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageThumbnail: UIImageView!
  
}
