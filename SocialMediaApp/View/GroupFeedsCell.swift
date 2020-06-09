//
//  GroupFeedsCell.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 09/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class GroupFeedsCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(image: UIImage, email: String, content: String) {
        self.profileImg.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
