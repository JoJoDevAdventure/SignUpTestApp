//
//  ViewController.swift
//  SignUp
//
//  Created by Youssef Bhl on 14/11/2021.
//

import UIKit
import FirebaseAuth

class SignUpController: UIViewController {
    
    
    //MARk : Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK : Propreties

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupTextFieldManager()
    }
    
    
    //MARK : Privat functions
    
    private func setupButtons(){
        signupButton.layer.cornerRadius = 20
        
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = UIColor.white.cgColor
    }
    
    private func setupTextFieldManager (){
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    

    //MARK : Actions
    
    @objc private func hideKeyboard() {
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
    @IBAction func signUpButtonWasPressed(_ sender: UIButton) {
        if usernameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            print("inscription de \(usernameTextField.text ?? "no name" )")
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (AuthResult, error) in
                if error != nil {
                    print(error.debugDescription)
                }else{
                    print("inscription de \(self.usernameTextField.text ?? "no name" ) ✅")
                    self.performSegue(withIdentifier: "GoToHome", sender: self)
                }
            }
           } else {
            print("erreur, les champs ne sont pas complets")
           }
    }
    
    
    @IBAction func logInButtonWasPressed(_ sender: UIButton) {
        print("Redirection vers l'ecran login")
    }
    
}



    //Mark Extension

extension SignUpController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


