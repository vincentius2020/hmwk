//
//  TeacherHomeViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 8/26/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class TeacherHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var responses = [Response]()
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var teacherHomeTableView: UITableView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
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
            profileImageView.image = image
            
        }
        
        //dismiss the image picker
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.responses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teacherFeedCell", for: indexPath) as! TeacherHomeTableViewCell

        let response = self.responses[indexPath.row]

        cell.Response = response

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        teacherHomeTableView.delegate = self
        teacherHomeTableView.dataSource = self
        
        usernameLabel.text = "yourName"
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




