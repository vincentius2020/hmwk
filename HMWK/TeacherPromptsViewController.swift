//
//  TeacherPromptsViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 9/7/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class TeacherPromptsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var teacherPromptCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teacherPromptCollectionView.dataSource = self
        teacherPromptCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
        
        let layout = self.teacherPromptCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.teacherPromptCollectionView.frame.size.width)/2, height: (self.teacherPromptCollectionView.frame.size.height/3))
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Singleton.singletonObject.allPrompts!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teacherPromptCell", for: indexPath) as! TeacherPromptCellCollectionViewCell
        
        let prompt = Singleton.singletonObject.allPrompts?[indexPath.row]
        
        cell.teacherPromptCellImageView?.image = prompt?.promptImage
        cell.teacherPromptCellLabel?.text = prompt?.promptTitle
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teacherCourseCell", for: indexPath) as! TeacherCourseCellCollectionViewCell
//
//        let course = Singleton.singletonObject.allCourses?[indexPath.row]
//
//        //        let prompt = Singleton.singletonObject.allPrompts?.first(where: { $0.promptID == response?.promptID })
//
//        cell.teacherCourseCellImageView?.image = course?.courseImage
//        cell.teacherCourseCellLabel?.text = course?.courseName
//
//
//        cell.layer.borderColor = UIColor.lightGray.cgColor
//        cell.layer.borderWidth = 0.5
//
//
//        return cell
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
