//
//  ReadFirebaseData.swift
//  HMWK
//
//  Created by Vincent Lewis on 2/24/19.
//  Copyright © 2019 HMWK. All rights reserved.
//

import Foundation
import Firebase

class ReadFirebaseData {
    
    
    //this function downloads user data and courses
    typealias readCurrentUserClosure = (Bool) -> Void
    
    class func readCurrentUserWithCourses(userId: String, completion: @escaping readCurrentUserClosure) {
        
        //first set the user to nil
        FirebaseData.data.currentUser = nil
        
        FirebaseData.data.db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false)
            } else {
                for userDict in querySnapshot!.documents {
                    
                    let enrolledCoursesRefs = userDict.data()["enrolledCourses"]
                    
                    readCoursesWithNoPrompts(courseRefs: enrolledCoursesRefs as! [DocumentReference], completion: {(success) in
                        if success == true {
                            
                            let user = readUserBasics(userDict.data())
                            
                            FirebaseData.data.currentUser = user
                            
                            NotificationCenter.default.post(name: Notification.Name("currentUserBasicDataRead"), object: nil)
                            
                            completion(true)
                            
                        } else {
                            print("error reading courses")
                            completion(false)
                        }
                    })
                }
            }
        }
    }
    
    class func readUserBasics(_ user: [String: Any]) -> User {
        let readUser = User(aUsername: user["name"] as! String,
                            userEmail:user["email"] as! String,
                            aProfileImage: UIImage(),
                            aUserType: user["userType"] as! String,
                            aEnrolledCourses: []
        )
        
        return readUser
    }
    
    //this function downloads courses, with no prompts
    
    typealias readCoursesClosure =  (Bool) -> Void
    
    class func readCoursesWithNoPrompts(courseRefs: [DocumentReference], completion: @escaping readCoursesClosure) {
        
        for courseRef in courseRefs {
            FirebaseData.data.db.document(courseRef.path).getDocument() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting document: \(err.localizedDescription)")
                    completion(false)
                } else {
                    
                    if let courseDict = querySnapshot?.data() {
                        
                        let course = Course(
                            courseID: courseDict["id"] as! String,
                            courseImage: UIImage(),
                            courseName: courseDict["name"] as! String,
                            coursePrompts: [], teacherID: courseDict["id"] as! String
                        )
                        
                        let courseId = courseDict["id"] as! String
                        
                        FirebaseData.data.currentUser?.enrolledCourses.removeAll(where: { $0.courseID == courseId})
                        FirebaseData.data.currentUser?.enrolledCourses.append(course)
                        
                        completion(true)
                    } else {
                        print("Course Dict is being read as nil")
                        completion(false)
                    }
                }
            }
        }
    }
    
    //this function downloads a course with prompts, but no responses
    
    typealias readCourseClosure =  (Bool) -> Void
    
    class func readCourse(courseId: String, completion: @escaping readCourseClosure) {
        let courseRef = FirebaseData.data.db.collection("courses").document("/\(courseId)")
        
        courseRef.getDocument(completion: {(document, err) in
            if let err = err {
                print("Error getting document: \(err.localizedDescription)")
                completion(false)
            } else {
                
                if let course = document!.data() {
                    
                    let course = Course(courseID: course["id"] as! String, courseImage: UIImage(), courseName: course["name"] as! String, coursePrompts: [], teacherID: course["id"] as! String)
                    
                    readPrompts(courseId: course.courseID, completion: {(success) in
                        
                        if success == true {
                            FirebaseData.data.currentUser?.enrolledCourses.removeAll(where: { $0.courseID == courseId })
                            FirebaseData.data.currentUser?.enrolledCourses.append(course)
                            
                            completion(true)
                        } else {
                            print("prompts couldnt be read")
                            completion(false)
                        }
                    })
                }
            }
        })
    }
    
    //this function downloads prompts, but no responses
    
    typealias readPromptsClosure =  (Bool) -> Void
    
    class func readPrompts(courseId: String, completion: @escaping readPromptsClosure) {
        
        FirebaseData.data.db.collection("courses").document("/\(courseId)").collection("prompts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err.localizedDescription)")
                completion(false)
            } else {
                
                for promptDoc in (querySnapshot?.documents)! {
                    
                    let promptDict = promptDoc.data()
                    
                    let readPrompt = Prompt(
                        promptID: promptDict["id"] as! String,
                        courseID: "", promptImage: UIImage(),
                        promptTitle: promptDict["title"] as! String,
                        promptComment: promptDict["comment"] as! String,
                        promptResponses: []
                    )
                    
                    FirebaseData.data.currentUser?.enrolledCourses.first(where: { $0.courseID == courseId })?.coursePrompts.append(readPrompt)
                    
                    //FirebaseData.data.promptsInEnrolledCourses?.append(readPrompt)
                }
                completion(true)
            }
        }
    }
    
    //this function downloads responses, and adds them to the appropriate prompt in the appropraite course
    
    typealias readResponsesClosure =  (Bool) -> Void
    
    class func readResponses(courseId: String, promptId: String, completion: @escaping readResponsesClosure) {
        
        FirebaseData.data.db.collection("courses").document("/\(courseId)").collection("prompts").document("/\(promptId)").collection("responses").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(false)
            } else {
                
                for responseDoc in (querySnapshot?.documents)! {
                    
                    let responseDict = responseDoc.data()
                    
                    let userRefString = responseDict["user"] as! String
                    //let userRef: DocumentReference?
                    
                    let documentRef = FirebaseData.data.db.document(userRefString)
                    // userRef = FirebaseData.data.db.document("\(documentRefString)")
                    
                    documentRef.getDocument(completion: { user, error in
                        
                        if let error = error {
                            print("user couldnt be read. " + error.localizedDescription)
                            completion(false)
                            
                        } else {
                            
                            //if user is actually there, read the response, otherwise dont.
                            if let userData = user?.data() {
                                let readResponse = Response(
                                    responseID: responseDict["id"] as! String,
                                    promptID: promptId,
                                    image: UIImage(),
                                    user: readUserBasics(userData),
                                    comment: responseDict["comment"] as! String
                                )
                                
                                let course = FirebaseData.data.currentUser?.enrolledCourses.first(where: { $0.courseID == courseId })
                                let prompt = course?.coursePrompts.first(where: { $0.promptID == promptId })
                                
                                prompt?.promptResponses.removeAll(where: { $0.promptID == promptId })
                                prompt?.promptResponses.append(readResponse)
                                
                                completion(true)
                            }
                        }
                    })
                }
            }
        }
    }
}
