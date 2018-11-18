//
//  UsefulLinksViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class UsefulLinksViewController: UIViewController {

    @IBOutlet weak var lblContent: KILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Useful Links"
        self.lblContent.text = StringUtility.getStringOf(keyName: "UsefulLinks")
        self.lblContent.urlLinkTapHandler = KIHandler().linkTapHandler
    }


}
