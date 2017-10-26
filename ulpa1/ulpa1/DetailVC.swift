//
//  DetailVC.swift
//  ulpa1
//
//  Created by Ke XU on 2017/8/29.
//  Copyright © 2017年 Unimelb. All rights reserved.
//
  // show the detail of a subject
import UIKit




class DetailVC: UIViewController {
    
    
    
    @IBOutlet weak var classcode: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var school: UILabel!
    @IBOutlet weak var offered: UILabel!
    
    @IBOutlet weak var intensity: UILabel!
    
    @IBOutlet weak var study_choice: UILabel!
    var moreInfo : String!
    var course: Course!

    // show the detail of subject
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classcode.text = "ClassCode: "+course.classcode
        state.text = "State: "+course.state
        language.text = "Language: "+course.language
        school.text = "School:  "+course.school
        offered.text = "next_offered: "+String(course.next_offered)
        intensity.text = "Regular / intensive : "+course.intensive
        study_choice.text = "Study Choice : "+course.study_choice
        self.moreInfo = course.url
        
        
    }
    // invoke the browser in iphone 
    @IBAction func btnClick(_ sender: UIButton) {
        let urlString = self.moreInfo
        if let url = URL(string: urlString!) {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
