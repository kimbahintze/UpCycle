//
//  RecycleDetailViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/20/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class RecycleDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var materialNameLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var howToRecycle: HowToRecycle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayInfo()
        materialNameLabel.font = UIFont(name: "Montserrat-Medium", size: 20)
        infoTextView.font = UIFont(name: "Montserrat-Medium", size: 14)
        infoTextView.isEditable = false
        navigationItem.titleView = logoTitleView()
    }
    
    func displayInfo() {
        guard let howToRecycle = howToRecycle else { return }
        materialNameLabel.text = howToRecycle.material
        infoTextView.text = howToRecycle.info
        logoImage.clipsToBounds = true
        logoImage.layer.cornerRadius = 15
    }
}
