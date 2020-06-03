//
//  DataService.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 01/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference() //access Database of Firebase; this is actually https://socialmediaapp-b3374.firebaseio.com/ from firebase

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users") //just like creating a folder in firebase to hold the user = https://socialmediaapp-b3374.firebaseio.com/users
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEEDS = DB_BASE.child("feeds")
    
    //create public var that will acces the private var
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEEDS: DatabaseReference {
        return _REF_FEEDS
    }
    
    //create a function that allows us to create users in firebase (contains unique id, name, email address)
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData) //in User we create a folder(child) - id and in the id folder we add other folders with  
        
    }
    
    //to upload a pst we need a message, UniqueUserId to know who posted the message, GroupKey is optional as we are not sure we have a group, and excaping handler whch will check if the send is complete:
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendCmplete: @escaping( _ status: Bool) -> ()) {
        if groupKey != nil {
            //send the group ref
        } else {
            REF_FEEDS.childByAutoId().updateChildValues(["content": message, "senderId": uid]) //we add the messages in REF_FEEDS and give a unique id for each message (childByAutoId) and then update the CildValues with dictionary
            sendCmplete(true) //once completed, we set the excaping handler to true
        }
    }
    
    func getAllFeedMessages(handler: @escaping(_ messages: [Message]) ->()) {
        var messageArray = [Message]()
        _REF_FEEDS.observeSingleEvent(of: .value) { (feedMessageSnapShot) in
            guard let feedMessageSnapShot = feedMessageSnapShot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapShot {
                let conten = message.childSnapshot(forPath: "content").value as! String // "content" is the name from firebase, and we need the cvalue of the content, hence .value
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: conten, senderId: senderId) //this is a new constant and not the one from the loop
                messageArray.append(message)
            }
            
        handler(messageArray)
        }
         
    }
    
}

