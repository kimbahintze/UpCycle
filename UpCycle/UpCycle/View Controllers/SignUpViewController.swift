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
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        usernameTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(validateForm), for: .editingChanged)
        validateForm()
        setFonts()
    }

    @IBAction func signup(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty else { return }
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        guard let confirmPW = confirmPasswordTextField.text, !confirmPW.isEmpty else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (dataresult, error) in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                self.duplicateUser()
                return
            }
            guard let uuid = Auth.auth().currentUser?.uid else { return }
            Database.database().reference().child("users").child(uuid).setValue(["username": username, "email": email, "onboarding": "false"])
            
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
        confirmPasswordTextField.text?.count ?? 0 > 0 &&
        usernameTextField.text?.count ?? 0 > 0
        
        if passwordTextField.text != confirmPasswordTextField.text {
            signupButton.isEnabled = false
        }
        
        if isFormValid {
            signupButton.isEnabled = true
        } else {
            signupButton.isEnabled = false
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setFonts() {
        confirmPasswordTextField.font = UIFont(name: "Montserrat-Medium", size: 12)
        usernameTextField.font = UIFont(name: "Montserrat-Medium", size: 12)
        emailTextField.font = UIFont(name: "Montserrat-Medium", size: 12)
        passwordTextField.font = UIFont(name: "Montserrat-Medium", size: 12)
        signupButton.titleLabel?.font = UIFont(name: "MontserratAlternates-ExtraBold", size: 13)
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
            passwordTextField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
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
