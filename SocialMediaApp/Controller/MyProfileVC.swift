//
//  MyProfileVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 03/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class MyProfileVC: UIViewController {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set tint image color for button
        let btnImg = UIImage(named: "logoutIcon")
        let tintedImg = btnImg?.withRenderingMode(.alwaysTemplate)
        signOutBtn.setImage(tintedImg, for: .normal)
        signOutBtn.tintColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to Logout?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do {
                 try Auth.auth().signOut() //this wil throw something hence we use do try  cathc
                let authVc = self.storyboard?.instantiateViewController(identifier: "AuthVC") as? AuthVC
                authVc?.modalPresentationStyle = .fullScreen
                self.present(authVc!, animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        logoutPopup.addAction(cancel)
        logoutPopup.addAction(logoutAction)
        
        present(logoutPopup, animated: true, completion: nil)
    }
    
}
