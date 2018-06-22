//
//  HomeViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var howToButton: UIButton!
    @IBOutlet weak var reuseButton: UIButton!
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var cycleLabel: UILabel!
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var centerLabel: UILabel!
    @IBOutlet weak var howToLabel: UILabel!
    @IBOutlet weak var reuseLabel: UILabel!
    @IBOutlet weak var slcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    func design() {
        upLabel.textColor = darkerGreen
        cycleLabel.textColor = darkGrayColor
        slcLabel.textColor = darkGrayColor
        upLabel.font = UIFont(name: "Montserrat-Medium", size: 33)
        cycleLabel.font = UIFont(name: "Montserrat-Medium", size: 30)
        slcLabel.font = UIFont(name: "Montserrat-Medium", size: 30)
        shopLabel.font = UIFont(name: "Montserrat-Thin", size: 13)
        centerLabel.font = UIFont(name: "Montserrat-Thin", size: 13)
        howToLabel.font = UIFont(name: "Montserrat-Thin", size: 13)
        reuseLabel.font = UIFont(name: "Montserrat-Thin", size: 13)
    }
}
