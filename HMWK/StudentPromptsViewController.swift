//
//  StudentPromptsViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 11/21/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class StudentPromptsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var studentPromptsCollectionView: UICollectionView!
    
    var selectedPrompt: Prompt?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentPromptsCollectionView.dataSource = self
        studentPromptsCollectionView.delegate = self
        
        let layout = self.studentPromptsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.studentPromptsCollectionView.frame.size.width)/2, height: (self.studentPromptsCollectionView.frame.size.height/3))
        
        // Do any additional setup after loading the view.
        
//        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))

        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return Singleton.singletonObject.allPrompts!.count
        return FirebaseData.data.promptsInEnrolledCourses!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentPromptCell", for: indexPath) as! StudentPromptsCollectionViewCell
        
//        let prompt = Singleton.singletonObject.allPrompts?[indexPath.row]
        let prompt = FirebaseData.data.promptsInEnrolledCourses?[indexPath.row]
        
        cell.studentPromptCellImageView?.image = prompt?.promptImage
        cell.studentPromptCellLabel?.text = prompt?.promptTitle
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedPrompt = Singleton.singletonObject.allPrompts?[indexPath.row]
        selectedPrompt = FirebaseData.data.promptsInEnrolledCourses?[indexPath.row]
        
        self.performSegue(withIdentifier: "studentPromptToResponses", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "studentPromptToResponses") {
            if let newVC = segue.destination as? StudentPromptResponsesViewController {
                newVC.currentPrompt = selectedPrompt
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    selectedPrompt = Singleton.singletonObject.allPrompts?[indexPath.row]
//
//    self.performSegue(withIdentifier: "studentCPR", sender: self)
//}
//
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if (segue.identifier == "studentCPR") {
//        if let newVC = segue.destination as? StudentCPRViewController {
//            newVC.currentPrompt = selectedPrompt
//        }
//    }
//}
