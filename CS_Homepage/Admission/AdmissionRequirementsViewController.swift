//
//  AdmissionRequirementsViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class AdmissionRequirementsViewController: UIViewController {
    @IBOutlet weak var lblContent: KILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Admission Requirements"
        self.lblContent.text = StringUtility.getStringOf(keyName: "AdmissionRequirements")
        self.lblContent.urlLinkTapHandler = KIHandler().linkTapHandler
    }


}
