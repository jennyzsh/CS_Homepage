//
//  HomePageViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class HomePageViewController: UIViewController {

    @IBOutlet weak var lblProgrammeOverview: UILabel!
    @IBOutlet weak var lblContactUs: KILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblProgrammeOverview.text = StringUtility.getStringOf(keyName: "ProgrammeOverview")
        self.lblContactUs.text = StringUtility.getStringOf(keyName: "ContactUs")
        self.lblContactUs.urlLinkTapHandler = KIHandler().linkTapHandler
    }
    
    @IBAction func clickToMoreDetail(_ sender: UIButton) {
    }
    
   
}
