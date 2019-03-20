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
    let courseImagePath:String
    let courseImage:UIImage
    let courseName:String
    var coursePrompts: [Prompt]
    let teacherID:String
    
    init(courseID:String, aCourseImagePath:String = "", courseImage:UIImage, courseName:String, coursePrompts:[Prompt], teacherID:String){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        // So for example we are passing in an UImage called image and setting it as our
        // image property for Post.
        self.courseID = courseID
        self.courseImagePath = aCourseImagePath
        self.courseImage = courseImage
        self.courseName = courseName
        self.coursePrompts = coursePrompts
        self.teacherID = teacherID
    }
    
}
