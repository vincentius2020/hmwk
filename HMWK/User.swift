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
    let profileImage:UIImage
    
    init(aUsername:String, aProfileImage:UIImage){
        //we are setting the User property of "username" to an aUsername property you are going to pass in
        username = aUsername
        profileImage = aProfileImage
    }
    
}
