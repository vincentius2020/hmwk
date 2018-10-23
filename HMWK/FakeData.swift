////
////  FakeData.swift
////  HMWK
////
////  Created by Vincent Lewis on 8/28/18.
////  Copyright © 2018 HMWK. All rights reserved.
////
//
//import Foundation
//
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
//
//
//
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
//
//class Course {
//
//    var courseID: String
//    var courseName: String
//    var teacher: User
//    var students: [User]
//    var responses: [Response]
//
//    init(inpCourseID: String, inpCourseName: String, inpTeacher: User, inpStudents: [User], inpResponses: [Response]) {
//
//        self.courseID = inpCourseID
//        self.courseName = inpCourseName
//        self.teacher = inpTeacher
//        self.students = inpStudents
//        self.responses = inpResponses
//    }
//
//}
//
//class Response {
//
//    var responseID: String
//    var student: User
//    var answer: String
//    var course: Course
//
//    init(inpID: String, inpStudent: User, inpAnswer: String, inpCourse: Course) {
//
//        self.responseID = inpID
//        self.student = inpStudent
//        self.answer = inpAnswer
//        self.course = inpCourse
//    }
//}
