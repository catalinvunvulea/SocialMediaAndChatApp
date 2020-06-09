//
//  GroupFeedsVC.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 09/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit

class GroupFeedsVC: UIViewController {
    
    @IBOutlet weak var groupNameLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupmembersLbl: UILabel!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var showHidemembersBtn: UIButton!
    @IBOutlet weak var membersView: UIView!
    
    
    var group: Group?
    var groupMessages = [Message]()
    var showMembers = false
    
    func initData (forGroup group: Group) {
           self.group = group
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupNameLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.groupmembersLbl.text = returnedEmails.joined(separator: ", ")
        }
        showHideMembers()
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in //line of code to observe any change in the REF_GROUPS on firebase
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!) { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showHideMembers()
    }

    @IBAction func showHidemembersBtnPressed(_ sender: Any) {
        showMembers = !showMembers
    showHideMembers()
        
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
    
    func showHideMembers() {
        if showMembers {
            membersView.isHidden = false
            showHidemembersBtn.setTitle("Hide members", for: .normal)
        } else {
            membersView.isHidden = true
            showHidemembersBtn.setTitle("Show members", for: .normal)
        }
    }
    
    
}

extension GroupFeedsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedsCell", for: indexPath) as? GroupFeedsCell else { return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(image: UIImage(named: "defaultProfileImage")! , email: email, content: message.content)
        }
            return cell
    }
}
    
