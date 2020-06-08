//
//  SecondViewController.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewGroup(_ sender: Any) {
        let createGroup = (storyboard?.instantiateViewController(identifier: "CreateGroupVC"))! as CreateGroupVC
        createGroup.modalPresentationStyle = .fullScreen
        present(createGroup,animated: true, completion: nil)
    }
    


}

