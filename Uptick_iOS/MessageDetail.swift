//
//  MessageDetail.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/22/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

class MessageDetail {
    
    private var _recipient: String!
    private var _messageKey: String!
    private var _messageRef: DatabaseReference!
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    var recipient: String {
        return _recipient
    }
    
    var messageKey: String {
        return _messageKey
    }
    
    var messageRef: DatabaseReference {
        return _messageRef
    }
    
    init(recipient: String) {
        _recipient = recipient
    }
    
    init(messageKey: String, messageData: Dictionary<String, AnyObject>){
        print ("Printing in init from MessageDetail")
        print ("MESSAGEKEY:")
        print (messageKey)
        print ("MESSAGEDATA:")
        print (messageData)
        _messageKey = messageKey
        
        if let recipient = messageData["recipient"] as? String {
            _recipient = recipient
        }
        
        _messageRef = Database.database().reference().child("recipient").child(_messageKey)
        print ("Printing in MessageDetail in init")
        print (_messageRef)
    }
    
    
    
}
