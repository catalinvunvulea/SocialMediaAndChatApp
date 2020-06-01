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
    
    
}
