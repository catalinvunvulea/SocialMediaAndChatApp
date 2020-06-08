//
//  GroupCell.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 08/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members"
         
    }
    
    
}



