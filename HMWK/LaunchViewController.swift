//
//  LaunchViewController.swift
//  HMWK
//
//  Created by Vincent Lewis on 11/25/18.
//  Copyright © 2018 HMWK. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var teacherLaunchButton: UIButton!
    @IBOutlet weak var studentLaunchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teacherLaunchButton.layer.cornerRadius = teacherLaunchButton.frame.size.width/5
        studentLaunchButton.layer.cornerRadius = studentLaunchButton.frame.size.width/5
        
        teacherLaunchButton.layer.borderWidth = 2
        teacherLaunchButton.layer.borderColor = UIColor.black.cgColor
        
        studentLaunchButton.layer.borderWidth = 2
        studentLaunchButton.layer.borderColor = UIColor.black.cgColor
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "hmwklogo1"))
                
        // Do any additional setup after loading the view.
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
