//
//  FirstViewController.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addPostBtnPressed(_ sender: Any) {
        let createPost = storyboard?.instantiateViewController(identifier: "CreatePostVC")
        createPost?.modalPresentationStyle = .fullScreen
        present(createPost!, animated: true, completion: nil)
        
    }
    
    
}

