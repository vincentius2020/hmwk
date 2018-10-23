//
//  CourseCell.swift
//  HMWK
//
//  Created by Vincent Lewis on 9/3/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import Foundation
import UIKit

class Course {
    
    let courseID:String
    var coursePrompts: [Prompt]
    let courseImage:UIImage
    let courseName:String
    
    init(courseID:String, coursePrompts:[Prompt], courseImage:UIImage, courseName:String){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        // So for example we are passing in an UImage called image and setting it as our
        // image property for Post.
        self.courseID = courseID
        self.coursePrompts = coursePrompts
        self.courseImage = courseImage
        self.courseName = courseName
    }
    
}
