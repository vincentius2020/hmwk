//
//  TeacherPromptsViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 9/7/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit
import Firebase

class TeacherPromptsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var teacherPromptCollectionView: UICollectionView!
    
    var selectedPrompt: Prompt?
    
    var prompts: [Prompt] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teacherPromptCollectionView.dataSource = self
        teacherPromptCollectionView.delegate = self
        
        for course in FirebaseData.data.enrolledCourses! {
            prompts.append(contentsOf: course.coursePrompts)
        }
        
        // Do any additional setup after loading the view.
        
        let layout = self.teacherPromptCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.teacherPromptCollectionView.frame.size.width)/2, height: (self.teacherPromptCollectionView.frame.size.height/3))
        
//        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return prompts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teacherPromptCell", for: indexPath) as! TeacherPromptCellCollectionViewCell
                
        let prompt = FirebaseData.data.promptsInEnrolledCourses?[indexPath.row]
        
        cell.teacherPromptCellImageView?.image = prompt?.promptImage
        cell.teacherPromptCellLabel?.text = prompt?.promptTitle
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        selectedPrompt = Singleton.singletonObject.allPrompts?[indexPath.row]
        selectedPrompt = FirebaseData.data.promptsInEnrolledCourses?[indexPath.row]
        
        self.performSegue(withIdentifier: "teacherPromptToResponses", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "teacherPromptToResponses") {
            if let newVC = segue.destination as? TeacherPromptResponsesViewController {
                newVC.currentPrompt = selectedPrompt
            }
        }
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

