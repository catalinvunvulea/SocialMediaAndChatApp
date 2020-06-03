//
//  FirstViewController.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var messagesArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messagesArray = returnedMessagesArray
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addPostBtnPressed(_ sender: Any) {
        let createPost = storyboard?.instantiateViewController(identifier: "CreatePostVC")
        createPost?.modalPresentationStyle = .fullScreen
        present(createPost!, animated: true, completion: nil)
        
    }
    
}

extension FeedVC: UITableViewDelegate {
    
}

extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell") as? FeedsCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let message = messagesArray[indexPath.row]
        cell.configureFeedCell(image: image!, email: message.senderId, content: message.content)
        return cell
    }
    
    
}

