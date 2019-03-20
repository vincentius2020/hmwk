//
//  Prompt.swift
//  HMWK
//
//  Created by Vincent Lewis on 9/6/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import Foundation
import UIKit

class Prompt {
    
    let promptID:String
    let courseID:String
    let promptImagePath:String
    let promptImage:UIImage
    let promptTitle:String
    let promptComment:String
    var promptResponses: [Response]
    
    init(promptID:String, courseID:String, aPromptImagePath:String = "", promptImage:UIImage, promptTitle:String, promptComment:String,  promptResponses:[Response]){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        // So for example we are passing in an UImage called image and setting it as our
        // image property for Post.
        self.promptID = promptID
        self.courseID = courseID
        self.promptImagePath = aPromptImagePath
        self.promptImage = promptImage
        self.promptTitle = promptTitle
        self.promptComment = promptComment
        self.promptResponses = promptResponses
    }
    
}
