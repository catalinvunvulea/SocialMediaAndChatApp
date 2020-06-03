//
//  FeedsCell.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 03/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class FeedsCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    
    func configureFeedCell(image: UIImage, email: String, content: String) {
        self.userImg.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
