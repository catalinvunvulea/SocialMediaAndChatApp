//
//  LoginVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTxtField: InsetTextField!
    @IBOutlet weak var passwordTxtField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailTxtField.text != nil && passwordTxtField.text != nil {
            AuthServices.instance.loginUser(withEmail: emailTxtField.text!, andPassword: passwordTxtField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(loginError?.localizedDescription as Any)
                }
                //if user doesn't have an account, the screen won't dismiss and code will continue
                AuthServices.instance.registerUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!) { (success, registrationError) in
                    if success  {
                        AuthServices.instance.loginUser(withEmail: self.emailTxtField.text!, andPassword: self.emailTxtField.text!) { (success, nil) in
                            print("Successfully registered user")}
                        self.dismiss(animated: true, completion: nil)
                        } else {
                            print(registrationError?.localizedDescription as Any)
                        }
                    }
                }
            }
        }
    }



extension LoginVC: UITextFieldDelegate {
    
}
