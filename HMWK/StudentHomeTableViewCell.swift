//
//  StudentHomeTableViewCell.swift
//  HMWK
//
//  Created by Vincent Lewis on 11/29/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class StudentHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var studentFeedImageView: UIImageView!
    @IBOutlet weak var studentResponseCellPromptTitle: UILabel!
    @IBOutlet weak var studentResponseCellUsername: UILabel!
    @IBOutlet weak var studentResponseCellComment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
