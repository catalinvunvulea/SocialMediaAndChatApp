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
    
    var emailArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        if emailSearchTextField.text == nil {
            emailArray = [] //if e haven't written aniyhing in the texfield, we need to clear all cells from the tableview, as we haven't searched anything
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        cell.configureCell(profileImage: image!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
}

extension CreateGroupVC: UITextFieldDelegate {
    
}
