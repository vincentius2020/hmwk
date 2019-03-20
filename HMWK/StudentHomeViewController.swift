//
//  StudentHomeViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 11/21/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit
import Firebase

class StudentHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var studentHomeUsername: UITextField!
    @IBOutlet weak var studentHomeImage: UIImageView!
    @IBOutlet weak var studentHomeEditButton: UIButton!
    @IBOutlet weak var studentHomeTableView: UITableView!
    
    
    @IBAction func editButtonClicked(_ sender: Any) {
        
        //create the controller
        let pickerController = UIImagePickerController()
        
        // message from pickerController to viewController
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            // check for simulator
            pickerController.sourceType = .photoLibrary
        } else {
            // check for iPhone or iPad and open camera
            // will they automatically be allowed to flip the camera?
            pickerController.sourceType = .camera
            pickerController.cameraDevice = .front
            pickerController.cameraCaptureMode = .photo
        }
        
        // present the pickerController
        self.present(pickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // get image from info dictionary
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //imageView has an image property set to be the image the user chose
            studentHomeImage.image = image
            
        }
        
        //dismiss the image picker
        dismiss(animated: true, completion: nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Singleton.singletonObject.allResponses!.count
        return FirebaseData.data.responsesInEnrolledCourses!.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentFeedCell", for: indexPath) as! StudentHomeTableViewCell
        
//        let response = Singleton.singletonObject.allResponses?[indexPath.row]
        let response = FirebaseData.data.responsesInEnrolledCourses?[indexPath.row]
        
//        let prompt = Singleton.singletonObject.allPrompts?.first(where: {$0.promptID == response?.promptID })
        let prompt = FirebaseData.data.promptsInEnrolledCourses?.first(where: {$0.promptID == response?.promptID })
        
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        cell.studentResponseCellUsername?.text = response?.user.username
        cell.studentResponseCellComment?.text = response?.comment
        
         cell.studentResponseCellPromptTitle?.text = prompt?.promptTitle
        
        cell.studentFeedImageView?.image = response?.image
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentHomeTableView.delegate = self
        studentHomeTableView.dataSource = self
        
//        studentHomeUsername.text = Singleton.singletonObject.studentUser1.username
        studentHomeUsername.text = FirebaseData.data.currentUser?.username
        
//        studentHomeImage.image = Singleton.singletonObject.studentUser1.profileImage
        studentHomeImage.image = FirebaseData.data.currentUser?.profileImage
        
        studentHomeImage.layer.cornerRadius = studentHomeImage.frame.size.width/2
        studentHomeImage.layer.borderWidth = 4
        studentHomeImage.layer.borderColor = UIColor.black.cgColor
        
//        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        teacherHomeTableView.delegate = self
//        teacherHomeTableView.dataSource = self
//
//        teacherHomeUsername.text = Singleton.singletonObject.teacherUser1.username
//        teacherHomeImageView.image = Singleton.singletonObject.teacherUser1.profileImage
//        editButton.setTitle("Edit",for: .normal)
//
//        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
//
//        teacherHomeImageView.layer.cornerRadius = teacherHomeImageView.frame.size.width/2
//
//        teacherHomeImageView.layer.borderWidth = 4
//        teacherHomeImageView.layer.borderColor = UIColor.black.cgColor
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
