//
//  AuthVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    @IBOutlet weak var loginWithFacebookBtn: UIButton!
    @IBOutlet weak var loginWithGoogleBtn: UIButton!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        loginWithFacebookBtn.layer.cornerRadius = 10
        loginWithGoogleBtn.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginWithFFacebookBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginWithGoogleBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginByEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        loginVC?.modalPresentationStyle = .fullScreen
        present(loginVC!, animated: true, completion: nil)
    }
    
}
