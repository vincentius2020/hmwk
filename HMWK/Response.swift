//
//  Response.swift
//  HMWK
//
//  Created by Vincent Lewis on 8/26/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import Foundation
import UIKit

class Response {
    
    let responseID:String
    let promptID:String
    let responseImagePath:String
    let image:UIImage
    let user:User
    let comment:String
    
    init(responseID:String, promptID:String, aResponseImagePath:String = "", image:UIImage, user:User, comment:String){
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        // So for example we are passing in an UImage called image and setting it as our
        // image property for Post.
        self.responseID = responseID
        self.promptID = promptID
        self.responseImagePath = aResponseImagePath
        self.image = image
        self.user = user
        self.comment = comment
    }
    
}
