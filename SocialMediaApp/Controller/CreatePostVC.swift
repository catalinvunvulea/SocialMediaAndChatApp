//
//  CreatePostVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 03/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self


        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textView.text != "" && textView.text != "Say something here..." {
            self.sendBtn.isEnabled = true
            DataService.instance.uploadPost(withMessage: self.textView.text, forUID: Auth.auth().currentUser!.uid, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = false
                    print("There was an error in sending the feed!")
                }
            }
        }
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""

    }
}

