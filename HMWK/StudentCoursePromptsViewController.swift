//
//  StudentCoursePromptsViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 12/9/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class StudentCoursePromptsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var studentCoursePromptsCollectionView: UICollectionView!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    
    
    var currentCourse: Course!
//    var selectedPrompt: Prompt?
    var storageRef: StorageReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentCoursePromptsCollectionView.dataSource = self
        studentCoursePromptsCollectionView.delegate = self
        
        let layout = self.studentCoursePromptsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.studentCoursePromptsCollectionView.frame.size.width)/2, height: (self.studentCoursePromptsCollectionView.frame.size.height/3))
        
        storageRef = Storage.storage().reference()
        let imageReference = storageRef.child(currentCourse.courseImagePath)
        let placeholderImage = UIImage(named: "flower.jpg")
        courseImageView.sd_setImage(with: imageReference, placeholderImage: placeholderImage)
        
        courseTitleLabel.text = currentCourse.courseName
        
        courseImageView.layer.borderWidth = 2
        courseImageView.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
        
//        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCourse.coursePrompts.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentCoursePromptCell", for: indexPath) as! StudentCoursePromptsCollectionViewCell

        let prompt = currentCourse.coursePrompts[indexPath.row]

        //        let prompt = Singleton.singletonObject.allPrompts?.first(where: { $0.promptID == response?.promptID })

        cell.studentCoursePromptCellImageView?.image = prompt.promptImage
        cell.studentCoursePromptCellLabel?.text = prompt.promptTitle


        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5


        return cell
    }

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedPrompt = currentCourse.coursePrompts[indexPath.row]
//
//        self.performSegue(withIdentifier: "studentCPR", sender: self)
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "studentCPR") {
//            if let newVC = segue.destination as? StudentCPRViewController {
//                newVC.currentPrompt = selectedPrompt
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

//
//override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//    // Dispose of any resources that can be recreated.
//}

