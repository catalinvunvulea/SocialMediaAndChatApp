//
//  SecondViewController.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in //this line of code will observe if there had been any changes on firebase to GROUPS and only then we call the getAllGroups func - whic will observe a single event
            DataService.instance.getAllGroups { (returnerGropusArray) in
            self.groupsArray = returnerGropusArray
            self.tableView.reloadData()
        }
        
        }
        
    }
    
    @IBAction func addNewGroup(_ sender: Any) {
        let createGroup = (storyboard?.instantiateViewController(identifier: "CreateGroupVC"))! as CreateGroupVC
        createGroup.modalPresentationStyle = .fullScreen
        present(createGroup,animated: true, completion: nil)
    }
    


}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell()}
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeeds = storyboard?.instantiateViewController(identifier: "GroupFeedsVC") as? GroupFeedsVC else { return }
        groupFeeds.initData(forGroup: groupsArray[indexPath.row])
        groupFeeds.modalPresentationStyle = .fullScreen
        present(groupFeeds, animated: true, completion: nil)
    }
    
}
