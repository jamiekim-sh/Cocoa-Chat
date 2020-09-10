//
//  MessageCell.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/31/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import UIKit
//custom designed message cell 
class MessageCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    

    
    //called when new messagecell created
    override func awakeFromNib() {
        super.awakeFromNib()
        //make it round corner
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height/7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
