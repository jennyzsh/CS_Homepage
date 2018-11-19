//
//  InfomationSessionsViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class InfomationSessionsViewController: UIViewController {

    @IBOutlet weak var lblContent1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Information Sessions"
        self.lblContent1.text = StringUtility.getStringOf(keyName: "InfoSession1")


    }
    
    @IBAction func didPressBtnRegister(_ sender: UIButton) {
        let url = "https://www.msc-cs.hku.hk/frmreginformationsession1"
        if let link = URL(string: url){
            UIApplication.shared.openURL(link)
        }
    }
    

}
