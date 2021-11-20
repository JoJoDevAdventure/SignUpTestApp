//
//  LogInController.swift
//  SignUp
//
//  Created by Youssef Bhl on 16/11/2021.
//

import UIKit
import FirebaseAuth


class LogInController: UIViewController {
    
    //Mark : Outlets
    
    @IBOutlet weak var emailTextFiels: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupTextFieldManager()

        
    }
    
    //Mark : Actions
    
    @IBAction func ReturnToSignUpScreen(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextFiels.text!, password: PasswordTextField.text!) { (AuthResult ,error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                self.performSegue(withIdentifier: "GoToHome2", sender: self)
            }
    }
}
    
    
    //Mark : private functions
    
    
    @objc private func hideKeyboard() {
        emailTextFiels.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
    
    
    private func setupButtons(){
        logInButton.layer.cornerRadius = 20
    }
    
    
    private func setupTextFieldManager (){
        emailTextFiels.delegate = self
        PasswordTextField.delegate = self
    
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    
        view.addGestureRecognizer(tapGesture)
    }
}
    
    


//Mark : extensions


extension LogInController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

