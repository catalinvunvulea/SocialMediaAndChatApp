//
//  MyProfileVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 03/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

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
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
    }
    
}
