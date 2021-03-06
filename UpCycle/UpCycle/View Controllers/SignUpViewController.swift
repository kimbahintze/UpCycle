//
//  SignUpViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var eulaLabel: UILabel!
    @IBOutlet weak var eulaButton: UIButton!
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        validateForm()
        setFonts()
    }

    @IBAction func signup(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (dataresult, error) in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                self.duplicateUser()
                return
            }
            
            guard let uuid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child("users").child(uuid).setValue(["username": username, "email": email, "postID": "false"])
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let postVC = sb.instantiateViewController(withIdentifier: "Post")
            self.present(postVC, animated: true, completion: nil)
        }
    }
    
    func duplicateUser() {
        let alertController = UIAlertController(title: "Email already in use", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func validateForm() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
        passwordTextField.text?.count ?? 0 > 0 &&
        usernameTextField.text?.count ?? 0 > 0
        
        if isFormValid {
            signupButton.isEnabled = true
        } else {
            signupButton.isEnabled = false
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setFonts() {
        usernameTextField.font = UIFont(name: MontserratMedium, size: 12)
        emailTextField.font = UIFont(name: MontserratMedium, size: 12)
        passwordTextField.font = UIFont(name: MontserratMedium, size: 12)
        signupButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 15)
        signupButton.setTitleColor(UIColor.white, for: .normal)
        signupButton.backgroundColor = lighterGreen
        signupButton.layer.cornerRadius = 15
        eulaLabel.font = UIFont(name: MontserratMedium, size: 12)
        eulaLabel.textColor = darkGrayColor
        eulaButton.setTitleColor(lighterGreen, for: .normal)
        eulaButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 12)
        memberLabel.textColor = darkGrayColor
        memberLabel.font = UIFont(name: MontserratMedium, size: 11)
        loginButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 11)
        loginButton.setTitleColor(lighterGreen, for: .normal)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            usernameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
          break
        default:
            break
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
