//
//  UserCell.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 08/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    var showCheckImg = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.userImg.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImg.isHidden = false
        } else {
            self.checkImg.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showCheckImg == false {
                checkImg.isHidden = false
                showCheckImg = true
            } else {
                checkImg.isHidden = true
                showCheckImg = false
            }
        }
    }

}
