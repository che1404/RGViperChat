//
//  ChatTableViewCell.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 3/6/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewContact: UIImageView!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var labelLastMessage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        imageViewContact.image = UIImage.fontAwesomeIcon(name: .user, textColor: UIColor.orange, size: CGSize(width: 40, height: 40))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
