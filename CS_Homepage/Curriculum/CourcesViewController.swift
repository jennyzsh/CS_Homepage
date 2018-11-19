//
//  CourcesViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/19.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cources"
    }
    
    @IBAction func indexDidChange(_ sender: UISegmentedControl) {
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            let controller = storyboard!.instantiateViewController(withIdentifier: "CompCoursesViewController") as! CompCoursesViewController
            controller.view.frame = self.view.bounds
            controller.willMove(toParent: self)
            self.containerView.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
        case 1:
            let controller = storyboard!.instantiateViewController(withIdentifier: "EComCoursesViewController") as! EComCoursesViewController
            controller.view.frame = self.view.bounds
            controller.willMove(toParent: self)
            self.containerView.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
        default:
            break
        }
    }
    
}
