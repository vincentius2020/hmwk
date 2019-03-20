//
//  User.swift
//  HMWK
//
//  Created by Vincent Lewis on 8/26/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let username:String
    let userEmail:String
    let profileImagePath:String
    let profileImage:UIImage
    let userType:String
    var enrolledCourses:[Course]
    
    init(aUsername:String, userEmail:String, aProfileImagePath: String = "", aProfileImage:UIImage, aUserType:String, aEnrolledCourses: [Course]){
        //we are setting the User property of "username" to an aUsername property you are going to pass in
        self.username = aUsername
        self.userEmail = userEmail
        self.profileImagePath = aProfileImagePath
        self.profileImage = aProfileImage
        self.userType = aUserType
        self.enrolledCourses = aEnrolledCourses
    }
    
}
