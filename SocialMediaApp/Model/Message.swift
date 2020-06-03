//
//  Message.swift
//  SocialMediaApp
//
//  Created by Dumitru Catalin Vunvulea on 03/06/2020.
//  Copyright © 2020 Dumitru Catalin Vunvulea. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderId: String
    
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
    
}
