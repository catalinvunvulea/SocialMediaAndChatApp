//
//  InsetTextField.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

  
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    //the text rectangle when you are using at the text field withouth editing or modifying
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.inset(by: padding) //bounds - the rectangle of texField and setting the inset of the text
    }
    
    //the text rectangle for when you are typing text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //rectangle for texPLacehHolder
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    //creating func to change font color of text holder text
    func setupView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)])
        
        self.attributedPlaceholder = placeholder
    }

}
