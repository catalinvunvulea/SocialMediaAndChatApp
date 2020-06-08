//
//  CreateGroupVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 08/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    
}
