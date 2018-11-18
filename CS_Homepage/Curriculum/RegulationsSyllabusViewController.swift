//
//  RegulationsSyllabusViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class RegulationsSyllabusViewController: UIViewController {
    
    @IBOutlet weak var lblContent: KILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Regulations"
        self.lblContent.text = StringUtility.getStringOf(keyName: "Regulations")
        self.lblContent.urlLinkTapHandler = KIHandler().linkTapHandler
    }


}
