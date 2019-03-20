//
//  WriteFirebaseData.swift
//  HMWK
//
//  Created by Vincent Lewis on 2/24/19.
//  Copyright © 2019 HMWK. All rights reserved.
//

import Foundation
import Firebase


class WriteFirebaseData {
    
    typealias writeUserClosure =  (Bool) -> Void
    
    class func writeCurrentUser(completion: @escaping writeUserClosure) {
        
        if let user = FirebaseData.data.currentUser {
            
            var coursesRefs: [String] = []
            
            for course in user.enrolledCourses {
                coursesRefs.append("/courses/\(course.courseID)")
            }
            
            let currentUserEmailAddress = (FirebaseData.data.currentUser?.userEmail)!
            
            FirebaseData.data.db.collection("users").document("\(currentUserEmailAddress)").setData([ "name": user.username, "userType": user.userType, "enrolledCourses": coursesRefs], merge: true, completion: { error in
                if let error = error {
                    print(error.localizedDescription)
                    completion(false)
                } else {
                    //success in writing basic user data with an array of courseRefs
                    completion(true)
                }
            })
        }
    }
    
    typealias writeCourseClosure =  (Bool) -> Void
    
    class func writeCourse(_ course: Course, completion: @escaping writeCourseClosure) {
        
        FirebaseData.data.db.collection("courses").document("\(course.courseID)").setData(["id": course.courseID, "name": course.courseName], merge: true, completion: { error in
            if let error = error {
                print("Error writing course. \(error.localizedDescription)")
                completion(false)
            } else {
                //success in writing basic course data, so now add prompts
                var promptsWritten = 0
                var promptsNotWritten = 0
                
                for prompt in course.coursePrompts {
                    writePrompt(prompt, completion: {(success) in
                        if success == true {
                            promptsWritten += 1
                        } else {
                            promptsNotWritten += 1
                            print("Prompt with UID \(prompt.promptID) wasnt written")
                        }
                        
                        if (promptsWritten + promptsNotWritten) == prompt.promptResponses.count {
                            //this function is complete. However, there is a chance that not all prompts were written
                            completion(true)
                        }
                    })
                }
            }
        })
    }
    
    
    typealias writePromptClosure =  (Bool) -> Void
    
    class func writePrompt(_ prompt: Prompt, completion: @escaping writePromptClosure) {
        
        FirebaseData.data.db.collection("courses").document("\(prompt.courseID)").collection("prompts").document("\(prompt.promptID)").setData([ "id": prompt.promptID, "title": prompt.promptTitle, "comment": prompt.promptComment], merge: true,  completion: { error in
            if let error = error {
                print("Error writing prompt. \(error.localizedDescription)")
                completion(false)
            } else {
                //success in writing basic prompt data, so now add responses
                var responsesWritten = 0
                var responsesNotWritten = 0
                
                for response in prompt.promptResponses {
                    writeResponse(response, courseId: prompt.courseID, completion: {(success) in
                        if success == true {
                            responsesWritten += 1
                        } else {
                            responsesNotWritten += 1
                        }
                        
                        if (responsesWritten + responsesNotWritten) == prompt.promptResponses.count {
                            //this function is complete. However, there is a chance that not all responses were written
                            completion(true)
                        }
                    })
                }
            }
        })
    }
    
    typealias writeResponseClosure = (Bool) -> Void
    
    class func writeResponse(_ response: Response, courseId: String, completion: @escaping writeResponseClosure) {
        FirebaseData.data.db.collection("courses").document("\(courseId)").collection("prompts").document("\(response.promptID)").collection("responses").document("\(response.responseID)").setData([ "id": response.responseID, "comment": response.comment, "promptId": response.promptID, "user": "/users/\(response.user.userEmail)"], merge: true,  completion: { error in
            if let error = error {
                print("Response with UID \(response.responseID) wasnt written. \(error.localizedDescription)")
                completion(false)
            } else {
                //success in writing reponse
                completion(true)
            }
        })
    }
    
    
    
    //Functions for saving images
    
    typealias uploadImageClosure = (Bool, String?) -> Void
    
    //uploading prompt image
    class func uploadPromptImage(image:UIImage, userUID:String, promptUID:String, completion: @escaping uploadImageClosure) {
        let storageRef = Storage.storage().reference()
        
        let storagePath = "\(userUID)/prompts/\(promptUID)"
        let imageData:Data = UIImageJPEGRepresentation(image, 0.2)!
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        storageRef.child(storagePath).putData(imageData, metadata: metadata, completion: {(metadata, error) in
            
            if error == nil {
                completion(true, storagePath)
            }
            else {
                completion(false, nil)
            }
        })
    }
    
    //uploading response image
    class func uploadResponseImage(image:UIImage, userUID:String, promptUID: String, responseUID:String, completion: @escaping uploadImageClosure) {
        let storageRef = Storage.storage().reference()
        
        let storagePath = "\(userUID)/prompts/\(promptUID)/responses/\(responseUID)"
        let imageData:Data = UIImageJPEGRepresentation(image, 0.2)!
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        storageRef.child(storagePath).putData(imageData, metadata: metadata, completion: {(metadata, error) in
            
            if error == nil {
                completion(true, storagePath)
            }
            else {
                completion(false, nil)
            }
        })
    }
    
    //uploading user profile image
    class func uploadUserProfileImage(image:UIImage, userUID:String, completion: @escaping uploadImageClosure) {
        let storageRef = Storage.storage().reference()
        
        let storagePath = "\(userUID)/profileImage"
        let imageData:Data = UIImageJPEGRepresentation(image, 0.2)!
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        storageRef.child(storagePath).putData(imageData, metadata: metadata, completion: {(metadata, error) in
            
            if error == nil {
                completion(true, storagePath)
            }
            else {
                completion(false, nil)
            }
        })
    }
}
