//
//  UserAgreementViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit

class UserAgreementViewController: UIViewController {

    @IBOutlet weak var userAgreementTextView: UITextView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAgreementTextView.layer.cornerRadius = 15
        userAgreementTextView.layer.borderColor = darkGrayColor.cgColor
        userAgreementTextView.layer.borderWidth = 1
        userAgreementTextView.isEditable = false
        userAgreementTextView.font = UIFont(name: "Montserrat-Medium", size: 13)
        userAgreementTextView.textColor = darkerGreen
    
    }
}
