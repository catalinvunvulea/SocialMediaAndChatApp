//
//  ShadowView.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    
    override func awakeFromNib() {
        
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
        
        super.awakeFromNib()
    }
    
}
