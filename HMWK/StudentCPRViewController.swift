//
//  StudentCPRViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 12/17/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class StudentCPRViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var studentCPRCollectionView: UICollectionView!
    
    var currentPrompt: Prompt!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentCPRCollectionView.dataSource = self
        studentCPRCollectionView.delegate = self

        let layout = self.studentCPRCollectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.studentCPRCollectionView.frame.size.width)/2, height: (self.studentCPRCollectionView.frame.size.height/3))

//        navigationItem.titleView = UIImageView(image: UIImage(named:"hmwklogo1"))

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentPrompt.promptResponses.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentCPRCell", for: indexPath) as! StudentCPRCollectionViewCell
        
        let response = currentPrompt.promptResponses[indexPath.row]
        
        cell.studentCPRImage?.image = response.image
        cell.studentCPRLabel?.text = response.comment
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
        
    }
    
    
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

