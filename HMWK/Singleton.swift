//
//  Singleton.swift
//  HMWK
//
//  Created by Vincent Lewis on 9/29/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import Foundation
import UIKit

class Singleton: NSObject {

    static let singletonObject = Singleton()

    var allUsers: [User]?
    var allCourses: [Course]?
    var allResponses: [Response]?
    var allPrompts: [Prompt]?
    
    var studentUser1: User
    var studentUser2: User
    var studentUser3: User

    var teacherUser1: User

    var economicsCourse: Course
    var apMicroCourse: Course
    var spanishCourse: Course

    var freeMarketsPrompt: Prompt
    var elasticityPrompt: Prompt
    var casaPrompt: Prompt
    
    var freeMarketsResponse1: Response
    var freeMarketsResponse2: Response
    var casaResponse1: Response
    var elasticityResponse1: Response

    
    public override init()
    {
        
        teacherUser1 = User(aUsername: "mr_lewis", aProfileImage: #imageLiteral(resourceName: "profileimage"), aUserType: "teacherUser")
        
        
        studentUser1 = User(aUsername: "jdogg219", aProfileImage: #imageLiteral(resourceName: "feedback"), aUserType: "studentUser")
        studentUser2 = User(aUsername: "manders", aProfileImage: #imageLiteral(resourceName: "profileimage"), aUserType: "studentUser")
        studentUser3 = User(aUsername: "miraclemike", aProfileImage: #imageLiteral(resourceName: "profileimage"), aUserType: "studentUser")
        
        
        freeMarketsResponse1 = Response(responseID: "001", promptID: "001", image: #imageLiteral(resourceName: "candy"), user: studentUser1, comment: "Look at all these options just for candy!")
        freeMarketsResponse2 = Response(responseID: "002", promptID: "001", image: #imageLiteral(resourceName: "hats"), user: studentUser3, comment: "Seeing all these hat choices made me think of free markets")
        casaResponse1 = Response(responseID: "003", promptID: "003", image: #imageLiteral(resourceName: "dad"), user: studentUser1, comment: "Este es mi padre.")
        elasticityResponse1 = Response(responseID: "004'", promptID: "002", image: #imageLiteral(resourceName: "chipotle"), user: studentUser1, comment: "Price...who cares!? I need my Chipotle!")

        
        freeMarketsPrompt = Prompt(promptID: "001", promptImage: #imageLiteral(resourceName: "market"), promptTitle: "Free Markets", promptComment: "Snap a pic of something that reminds you of the Free Market", promptResponses: [freeMarketsResponse2, freeMarketsResponse1])
        elasticityPrompt = Prompt(promptID: "002", promptImage: #imageLiteral(resourceName: "inelastic"), promptTitle: "Inelastic", promptComment: "Take a pic of a good or service for which you are very inelastic in your demand!", promptResponses: [elasticityResponse1])
        casaPrompt = Prompt(promptID: "003", promptImage: #imageLiteral(resourceName: "casa"), promptTitle: "Casa", promptComment: "Encuentra y etiqueta algo en tu hogar.", promptResponses: [casaResponse1])
        
        
        economicsCourse = Course(courseID: "001", coursePrompts: [freeMarketsPrompt], courseImage: #imageLiteral(resourceName: "econ"), courseName: "Economics")
        apMicroCourse = Course(courseID: "002", coursePrompts: [elasticityPrompt], courseImage: #imageLiteral(resourceName: "apmicro"), courseName: "AP Micro")
        spanishCourse = Course(courseID: "003", coursePrompts: [casaPrompt], courseImage: #imageLiteral(resourceName: "spanish"), courseName: "Spanish I")

        
        allCourses = [economicsCourse, apMicroCourse, spanishCourse]
        allUsers = [studentUser1, studentUser2, studentUser3, teacherUser1]
        allPrompts = [freeMarketsPrompt, elasticityPrompt, casaPrompt]
        allResponses = [freeMarketsResponse1, freeMarketsResponse2, casaResponse1, elasticityResponse1]
        
    }

}


    //    studentUser = User(inpID: "123", inpUsername: "Vince", inpCoursesTeaching: [], inpCoursesEnrolledIn: [])
    //
    //        teacherUser = User(inpID: "145", inpUsername: "Sanjay", inpCoursesTeaching: [], inpCoursesEnrolledIn: [])
    //
    //        historyCourse = Course(inpCourseID: "courseX", inpCourseName: "History", inpTeacher: teacherUser, inpStudents: [studentUser], inpResponses: [])
    //
    //        aHistoryResponse = Response(inpID: "historyResp", inpStudent: studentUser, inpAnswer: "This answer string will be an image eventually", inpCourse: historyCourse)
    //
    //        studentUser.coursesEnrolledIn = [historyCourse]
    //        teacherUser.coursesTeaching = [historyCourse]
    //
    //        historyCourse.responses = [aHistoryResponse]









//my teacherUser class
//class teacherUser: NSObject {
//
//    static let aTeacherUser = teacherUser()
//
//    var username: String
//    var password: String
//    var profileImage: String
//    var coursesTeaching: [Course]
//    var promptsCreated: [Prompt]
//
//    init(inpUsername: String, inpPassword: String, inpProfileImage: String, inpCoursesTeaching: [Course], inpPromptsCreated: [Prompt]) {
//
//        self.username = inpUsername
//        self.password = inpPassword
//        self.profileImage = inpProfileImage
//        self.coursesTeaching = inpCoursesTeaching
//        self.promptsCreated = inpPromptsCreated
//
//    }
//
//}


//class FakeData: NSObject {
//
//    static let myFakeDataSingleton = FakeData()
//
//    var allUsers: [User]
//    var allCourses: [Course]
//    var allResponses: [Response]
//
//    var studentUser: User
//    var teacherUser: User
//    var historyCourse: Course
//    var aHistoryResponse: Response
//
//    public override init()
//    {
//
//        studentUser = User(inpID: "123", inpUsername: "Vince", inpCoursesTeaching: [], inpCoursesEnrolledIn: [])
//
//        teacherUser = User(inpID: "145", inpUsername: "Sanjay", inpCoursesTeaching: [], inpCoursesEnrolledIn: [])
//
//        historyCourse = Course(inpCourseID: "courseX", inpCourseName: "History", inpTeacher: teacherUser, inpStudents: [studentUser], inpResponses: [])
//
//        aHistoryResponse = Response(inpID: "historyResp", inpStudent: studentUser, inpAnswer: "This answer string will be an image eventually", inpCourse: historyCourse)
//
//        studentUser.coursesEnrolledIn = [historyCourse]
//        teacherUser.coursesTeaching = [historyCourse]
//
//        historyCourse.responses = [aHistoryResponse]
//
//        allUsers = [studentUser, teacherUser]
//
//        allCourses = [historyCourse]
//
//        allResponses = [aHistoryResponse]
//
//    }
//
//
//}

//class User {
//
//    var userID: String
//    var username: String
//    var coursesTeaching: [Course]
//    var coursesEnrolledIn: [Course]
//
//    init(inpID: String, inpUsername: String, inpCoursesTeaching: [Course], inpCoursesEnrolledIn: [Course]) {
//
//        self.userID = inpID
//        self.username = inpUsername
//        self.coursesTeaching = inpCoursesTeaching
//        self.coursesEnrolledIn = inpCoursesEnrolledIn
//    }
//
//
//}
