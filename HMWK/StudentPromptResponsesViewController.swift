//
//  StudentPromptResponsesViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 12/17/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class StudentPromptResponsesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var studentPromptResponsesCollectionView: UICollectionView!
    @IBOutlet weak var promptImageView: UIImageView!
    @IBOutlet weak var promptTitleLabel: UILabel!
    @IBOutlet weak var promptCommentLabel: UILabel!
    
    var currentPrompt: Prompt!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentPromptResponsesCollectionView.dataSource = self
        studentPromptResponsesCollectionView.delegate = self
        
        let layout = self.studentPromptResponsesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.studentPromptResponsesCollectionView.frame.size.width)/2, height: (self.studentPromptResponsesCollectionView.frame.size.height/2.25))
        
        promptImageView.image = currentPrompt.promptImage
        promptTitleLabel.text = currentPrompt.promptTitle
        promptCommentLabel.text = currentPrompt.promptComment
        
        promptImageView.layer.borderWidth = 2
        promptImageView.layer.borderColor = UIColor.black.cgColor
        
//        navigationItem.titleView = UIImageView(image: UIImage(named:"hmwklogo1"))
        
        // Do any additional setup after loading the view.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentPrompt.promptResponses.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "studentPromptResponseCell", for: indexPath) as! StudentPromptResponsesCollectionViewCell
        
        let response = currentPrompt.promptResponses[indexPath.row]
        
        cell.studentPromptResponseImageView?.image = response.image
        cell.studentPromptResponseLabel?.text = response.comment
        
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


