//
//  AboutHkuViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class AboutHkuViewController: UIViewController {
    @IBOutlet weak var lblAboutHku: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "About HKU"
        self.lblAboutHku.text = StringUtility.getStringOf(keyName:"AboutHKU")
    }
    

}
