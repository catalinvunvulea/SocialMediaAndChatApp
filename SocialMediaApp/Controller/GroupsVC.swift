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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewGroup(_ sender: Any) {
        let createGroup = (storyboard?.instantiateViewController(identifier: "CreateGroupVC"))! as CreateGroupVC
        createGroup.modalPresentationStyle = .fullScreen
        present(createGroup,animated: true, completion: nil)
    }
    


}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { return UITableViewCell()}
        cell.configureCell(title: "My first group", description: "This is just a description used for presentation purpous, and see how many lines can I write. it would appear that there are so many lines I can add and the think is that I will have to..bla bla bla", memberCount: 20)
        return cell
        
    }
    
    
}
