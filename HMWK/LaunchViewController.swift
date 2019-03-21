//
//  LaunchViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 11/25/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class LaunchViewController: UIViewController {

    @IBOutlet weak var teacherLaunchButton: UIButton!
    @IBOutlet weak var studentLaunchButton: UIButton!
    
//      This is my comment for testing purposes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseData.data.currentUser = Singleton.singletonObject.teacherUser1
        
        ReadFirebaseData.readCurrentUserWithCourses(userId: (FirebaseData.data.currentUser?.userEmail)!, completion: {(success) in
            if success {
                print("successfully read user")
                
                FirebaseData.data.enrolledCourses = FirebaseData.data.currentUser?.enrolledCourses
                
                for course in
                    FirebaseData.data.currentUser!.enrolledCourses {
                        FirebaseData.data.promptsInEnrolledCourses?.append(contentsOf: course.coursePrompts)
                }
                
                for course in
                    FirebaseData.data.currentUser!.enrolledCourses {
                        for prompt in course.coursePrompts {
                            FirebaseData.data.responsesInEnrolledCourses?.append(contentsOf: prompt.promptResponses)
                        }
                }
                
                
            } else {
                print("error")
            }
        })
        
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        FirebaseData.data.db = Firestore.firestore()
        
//        WriteFirebaseData.writeCourse(FirebaseData.data.enrolledCourses![1], completion: {(success) in
//            if success {
//                //course is downloaded
//            } else {
//                //error
//            }
//        })
//
//        WriteFirebaseData.writeCourse(FirebaseData.data.enrolledCourses![2], completion: {(success) in
//            if success {
//                //course is downloaded
//            } else {
//                //error
//            }
//        })
//
//        WriteFirebaseData.writeCourse(FirebaseData.data.enrolledCourses![3], completion: {(success) in
//            if success {
//                //course is downloaded
//            } else {
//                //error
//            }
//        })
        
        
        ReadFirebaseData.readCourse(courseId: "001", completion: {(success) in
            if success {
                print("sucessfully read")
            } else {
                print("Errrrrr")
            }
        })
        
        
        teacherLaunchButton.layer.cornerRadius = teacherLaunchButton.frame.size.width/5
        studentLaunchButton.layer.cornerRadius = studentLaunchButton.frame.size.width/5
        
        teacherLaunchButton.layer.borderWidth = 2
        teacherLaunchButton.layer.borderColor = UIColor.black.cgColor
        
        studentLaunchButton.layer.borderWidth = 2
        studentLaunchButton.layer.borderColor = UIColor.black.cgColor
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
                
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
