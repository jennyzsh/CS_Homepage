//
//  LearningEnvironmentDetailsViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class LearningEnvironmentDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblContent: KILabel!
    
    var background_color: UIColor = UIColor.gray
    var key = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = background_color
        self.lblContent.text = StringUtility.getStringOf(keyName: key)
        self.lblContent.urlLinkTapHandler = KIHandler().linkTapHandler
    }

    @IBAction func didPressBtnClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
