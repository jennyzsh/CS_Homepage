//
//  DirectorMsgViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class DirectorMsgViewController: UIViewController {

    @IBOutlet weak var lblDirectorMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.lblDirectorMsg.text = StringUtility.getStringOf(keyName: "DirectorMsg")
    }
    

}
