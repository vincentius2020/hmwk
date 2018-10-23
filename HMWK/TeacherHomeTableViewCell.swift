//
//  TeacherHomeTableViewCell.swift
//  HMWK
//
//  Created by Vincent Lewis on 8/26/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class TeacherHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var teacherFeedImageView: UIImageView!
    @IBOutlet weak var responseCellUsername: UILabel!
    @IBOutlet weak var responseCellPromptTitle: UILabel!
    @IBOutlet weak var responseCellComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
