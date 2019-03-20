//
//  FirebaseData.swift
//  HMWK
//
//  Created by Vincent Lewis on 2/24/19.
//  Copyright © 2019 HMWK. All rights reserved.
//

import Foundation
import Firebase

class FirebaseData {
    static let data = FirebaseData()
    
    var db: Firestore!
    
    var currentUser: User?
    
    var enrolledCourses: [Course]?
    
    var promptsInEnrolledCourses: [Prompt]?
    
    var responsesInEnrolledCourses: [Response]?
    
}
