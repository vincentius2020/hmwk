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

    var teacherUser1: User

    var economicsCourse: Course
    var apMicroCourse: Course
    var spanishCourse: Course
    var english8Course: Course

    var freeMarketsPrompt: Prompt
    var scarcityPrompt: Prompt
    var demandPrompt: Prompt
    var elasticityPrompt: Prompt
    var casaPrompt: Prompt
    var betPrompt: Prompt
    
    var freeMarketsResponse1: Response
    var freeMarketsResponse2: Response
    var scarcityResponse1: Response
    var scarcityResponse2: Response
    var scarcityResponse3: Response
    var scarcityResponse4: Response
    var scarcityResponse5: Response
    var scarcityResponse6: Response
    var demandResponse1: Response
    var casaResponse1: Response
    var elasticityResponse1: Response
    var betResponse: Response

    
    public override init()
    {
        
        teacherUser1 = User(aUsername: "mr_lewis", aProfileImage: #imageLiteral(resourceName: "profileimage"), aUserType: "teacherUser")
        
        
        studentUser1 = User(aUsername: "jdogg219", aProfileImage: #imageLiteral(resourceName: "feedback"), aUserType: "studentUser")
        
        
        freeMarketsResponse1 = Response(responseID: "001", promptID: "001", image: #imageLiteral(resourceName: "candy"), user: studentUser1, comment: "Look at all these options just for candy!")
        freeMarketsResponse2 = Response(responseID: "002", promptID: "001", image: #imageLiteral(resourceName: "hats"), user: studentUser1, comment: "Seeing all these hat choices made me think of free markets")
        scarcityResponse1 = Response(responseID: "006", promptID: "005", image: #imageLiteral(resourceName: "gas"), user: studentUser1, comment: "I have to plan how I use my gas each week.")
        scarcityResponse2 = Response(responseID: "007", promptID: "005", image: #imageLiteral(resourceName: "time"), user: studentUser1, comment: "There's only so much time in a day. I try to make it count!")
        scarcityResponse3 = Response(responseID: "008", promptID: "005", image: #imageLiteral(resourceName: "space"), user: studentUser1, comment: "Space is scarce in our house, so we have to put a bunch of beds in one room.")
        scarcityResponse4 = Response(responseID: "009", promptID: "005", image: #imageLiteral(resourceName: "food"), user: studentUser1, comment: "Food is always scarce with my brothers around!")
        scarcityResponse5 = Response(responseID: "010", promptID: "005", image: #imageLiteral(resourceName: "pass"), user: studentUser1, comment: "Only 6 minutes of passing period time, yet so much to do =/")
        scarcityResponse6 = Response(responseID: "011", promptID: "005", image: #imageLiteral(resourceName: "wallet"), user: studentUser1, comment: "Money is looking scarce is my wallet right now!")
        demandResponse1 = Response(responseID: "012", promptID: "006", image: #imageLiteral(resourceName: "coffee"), user: studentUser1, comment: "My demand for coffee makes me late in the morning!")
        casaResponse1 = Response(responseID: "003", promptID: "003", image: #imageLiteral(resourceName: "dad"), user: studentUser1, comment: "Este es mi padre.")
        elasticityResponse1 = Response(responseID: "004'", promptID: "002", image: #imageLiteral(resourceName: "chipotle"), user: studentUser1, comment: "Price...who cares!? I need my Chipotle!")
        betResponse = Response(responseID: "005", promptID: "004", image: #imageLiteral(resourceName: "mom"), user: studentUser1, comment: "I couldn't live without my mom. She's everything to me!")
        
        
        freeMarketsPrompt = Prompt(promptID: "001", courseID: "001", promptImage: #imageLiteral(resourceName: "market"), promptTitle: "Free Markets", promptComment: "Snap a pic of something that reminds you of the Free Market", promptResponses: [freeMarketsResponse2, freeMarketsResponse1])
        scarcityPrompt = Prompt(promptID: "005", courseID: "001", promptImage: #imageLiteral(resourceName: "bottle"), promptTitle: "Scarcity", promptComment: "How does scarcity impact YOU?? Find an example of you dealing with scarcity in your day-to-day activities.", promptResponses: [scarcityResponse1, scarcityResponse2, scarcityResponse3, scarcityResponse4, scarcityResponse5, scarcityResponse6])
        demandPrompt = Prompt(promptID: "006", courseID: "001", promptImage: #imageLiteral(resourceName: "demand"), promptTitle: "Demand", promptComment: "How does demand affect you? Capture a moment when your behavior is impacted by your demand for a certain good.", promptResponses: [demandResponse1])
        elasticityPrompt = Prompt(promptID: "002", courseID: "002", promptImage: #imageLiteral(resourceName: "inelastic"), promptTitle: "Inelastic", promptComment: "Capture a good or service for which you are very inelastic in your demand!", promptResponses: [elasticityResponse1])
        casaPrompt = Prompt(promptID: "003", courseID: "003", promptImage: #imageLiteral(resourceName: "casa"), promptTitle: "Casa", promptComment: "Encuentra y etiqueta algo en tu hogar.", promptResponses: [casaResponse1])
        betPrompt = Prompt(promptID: "004", courseID: "004", promptImage: #imageLiteral(resourceName: "cav"), promptTitle: "The Bet", promptComment: "Post one thing you couldn't live without!", promptResponses: [betResponse])
        

        economicsCourse = Course(courseID: "001", courseImage: #imageLiteral(resourceName: "econ"), courseName: "Economics", coursePrompts: [freeMarketsPrompt, scarcityPrompt, demandPrompt])
        apMicroCourse = Course(courseID: "002", courseImage: #imageLiteral(resourceName: "apmicro"), courseName: "AP Micro", coursePrompts: [elasticityPrompt])
        spanishCourse = Course(courseID: "003", courseImage: #imageLiteral(resourceName: "spanish"), courseName: "Spanish I", coursePrompts: [casaPrompt])
        english8Course = Course(courseID: "004", courseImage: #imageLiteral(resourceName: "books"), courseName: "English 8", coursePrompts: [betPrompt])

        
        allCourses = [economicsCourse, apMicroCourse, spanishCourse, english8Course]
        allUsers = [studentUser1, teacherUser1]
        allPrompts = [freeMarketsPrompt, elasticityPrompt, casaPrompt, betPrompt, scarcityPrompt, demandPrompt]
        allResponses = [freeMarketsResponse1, freeMarketsResponse2, casaResponse1, elasticityResponse1, betResponse, scarcityResponse1, scarcityResponse2, scarcityResponse3, scarcityResponse4, scarcityResponse5, scarcityResponse6, demandResponse1]
        
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
