//
//  MessagesCell.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/22/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MessagesCell: UITableViewCell {
    
    @IBOutlet var receivedMessageLabel: UILabel!
    @IBOutlet var receivedMessageView: UIView!
    
    @IBOutlet var sentMessageLabel: UILabel!
    @IBOutlet var sentMessageView: UIView!
    
    var message: Message!
    
    var currentUser = KeychainWrapper.standard.string(forKey: "uid")

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(message: Message) {
        self.message = message
        
        if message.sender == currentUser {
            sentMessageView.isHidden = false
            sentMessageLabel.text = message.message
            
            receivedMessageView.isHidden = true
            receivedMessageLabel.text = ""
        } else {
            
            sentMessageView.isHidden = true
            sentMessageLabel.text = ""
            
            receivedMessageView.isHidden = false
            receivedMessageLabel.text = message.message
            
        }
    }

}
