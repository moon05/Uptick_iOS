//
//  MessageDetailCell.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/22/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

class MessageDetailCell: UITableViewCell {
    
    @IBOutlet var recipientImage: UIImageView!
    @IBOutlet var recipientName: UILabel!
    @IBOutlet var chatPreview: UILabel!
    
    var messageDetail: MessageDetail!
    
    var userPostKey: DatabaseReference!
    
    let currentUser = KeychainWrapper.standard.string(forKey: "uid")
    
    func configureCell(messageDetail: MessageDetail) {
        
        self.messageDetail = messageDetail
        let recipientData = Database.database().reference().child("users").child(messageDetail.recipient)
        print ("Printing from MessageDetailCell")
        print ("RECIPIENTDATA:")
        print (recipientData)
        recipientData.observe(.value, with: { (snapshot) in
            let data = snapshot.value as! Dictionary<String, AnyObject>
            print ("DATA: (as dictionary)")
            print (data)
            let username = data["username"]
//            let userImage = data["userImg"]
            
            self.recipientName.text = username as? String
            
//            let ref = Storage.storage().reference(forURL: userImage! as! String)
//            ref.getData(maxSize: 100000, completion: {(data, error) in
//                if error != nil {
//                    print ("Could not load image")
//                } else {
//                    if let imageData = data {
//                        if let img = UIImage(data: imageData) {
//                            self.recipientImage.image = img
//                        }
//                    }
//                }
//            })
        })
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
