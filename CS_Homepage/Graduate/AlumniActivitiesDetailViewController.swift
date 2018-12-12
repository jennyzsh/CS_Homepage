//
//  AlumniActivitiesDetailViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/19.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import WebKit

class AlumniActivitiesDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Alumni Activities"
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
    
    //click the button to dismiss current view controller
    @IBAction func didPressBtnClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
