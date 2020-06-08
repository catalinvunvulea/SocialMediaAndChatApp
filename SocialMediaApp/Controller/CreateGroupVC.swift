//
//  CreateGroupVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 08/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController {
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    var chosenEmailArray = [String]() //array of emails selected to add to group
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
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
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIds(forUsernames: chosenEmailArray) { (idsArray) in
                var userId = idsArray
                userId.append(Auth.auth().currentUser!.uid)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userId) { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Group could not be created, please try again")
                    }
                }
                
            }
        }
    }
    
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { return UITableViewCell()}
        let image = UIImage(named: "defaultProfileImage")
        
        if chosenEmailArray.contains(cell.emailLbl.text!) {
            cell.configureCell(profileImage: image!, email: emailArray[indexPath.row], isSelected: true)
        } else {
           cell.configureCell(profileImage: image!, email: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !chosenEmailArray.contains(cell.emailLbl.text!) {
            chosenEmailArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = chosenEmailArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            chosenEmailArray = chosenEmailArray.filter({ $0 != cell.emailLbl.text }) //$0 is just like a temporary variable in a for in loop; this line of code will filter and return al elements of choseEmailArray except the current selected one (cell.emailLbl.text)
            if chosenEmailArray.count >= 1 {
                groupMemberLbl.text = chosenEmailArray.joined(separator: ", ")
            } else {
                groupMemberLbl.text = "Add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
    
}

extension CreateGroupVC: UITextFieldDelegate {
    
}
