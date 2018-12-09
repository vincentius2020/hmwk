//
//  StudentCoursePromptsViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 12/9/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class StudentCoursePromptsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var currentCourse: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCourse.coursePrompts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentCoursePromptCell", for: indexPath) as! StudentPromptsCollectionViewCell

        let prompt = currentCourse.coursePrompts[indexPath.row]

        //        let prompt = Singleton.singletonObject.allPrompts?.first(where: { $0.promptID == response?.promptID })

        cell.studentPromptCellImageView?.image = prompt.promptImage
        cell.studentPromptCellLabel?.text = prompt.promptTitle


        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5


        return cell
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
