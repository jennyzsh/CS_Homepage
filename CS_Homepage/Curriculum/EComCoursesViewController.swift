//
//  EComCoursesViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/19.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class EComCoursesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Courses"
    }

    @IBAction func didPressBtnCourses(_ sender: UIButton) {
        let url = "https://www.ecom-icom.hku.hk/Curriculum/Courses"
        if let link = URL(string: url){
            UIApplication.shared.openURL(link)
        }
    }
    
}
