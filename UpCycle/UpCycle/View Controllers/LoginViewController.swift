//
//  LoginViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var notMemberLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextFIeld.delegate = self
        setFonts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            guard let postVC = self.storyboard?.instantiateViewController(withIdentifier: "Post") else { return }
            self.present(postVC, animated: false, completion: nil)
        }
        emailTextField.text = nil
        passwordTextFIeld.text = nil
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                let alert = UIAlertController(title: "An email has been sent to \(email) to reset password.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("An email has been sent to \(email) to reset the password.")
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextFIeld.text, !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                print("Error loggin in: \(error.localizedDescription)")
                self.resetPasswordPopup()
            }
            guard let postVC = self.storyboard?.instantiateViewController(withIdentifier: "Post") else { return }
            self.present(postVC, animated: false, completion: nil)
        }
    }
    
    func resetPasswordPopup() {
        let alert = UIAlertController(title: "Error logging in.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func validateEmail() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 &&
        passwordTextFIeld.text?.count ?? 0 > 0
        
        if isFormValid {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    func setFonts() {
        welcomeLabel.font = UIFont(name: "MontserratAlternates-ExtraBold", size: 45)
        emailTextField.font = UIFont(name: "Montserrat-Medium", size: 15)
        passwordTextFIeld.font = UIFont(name: "Montserrat-Medium", size: 15)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Montserrat-Thin", size: 13)
        loginButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        notMemberLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        signUpButton.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 14)
        passwordTextFIeld.isSecureTextEntry = true
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
