//
//  ViewProjectViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class ViewProjectViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var projectInstructionsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setFonts()
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setFonts() {
        projectTitleLabel.font = UIFont(name: "MontserratAlternates-ExtraBold", size: 14)
        projectInstructionsLabel.font = UIFont(name: "Montserrat-Thin", size: 11)
    }
}
