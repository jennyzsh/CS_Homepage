//
//  ApplicationProceduresViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel
import WebKit

class ApplicationProceduresViewController: UIViewController {

    @IBOutlet weak var lblContent1: KILabel!
    @IBOutlet weak var lblContent2: KILabel!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var lblContent3: KILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Application Procedures"
        self.lblContent1.text = StringUtility.getStringOf(keyName: "ApplicationProcedure1")
        self.lblContent1.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.lblContent2.text = StringUtility.getStringOf(keyName: "ApplicationProcedure2")
        self.lblContent2.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.lblContent3.text = StringUtility.getStringOf(keyName: "ApplicationProcedure3")
        self.lblContent3.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.loadHTML()
        
    }
    
    func loadHTML() {
        if let url = Bundle.main.url(forResource: "application_procedure_table", withExtension: "html") {
            webview.loadFileURL(url, allowingReadAccessTo: url)
            let request = URLRequest(url: url)
            webview.load(request)
        }
    }

    @IBAction func didPressBtnOnlineApplication(_ sender: UIButton) {
        let url = "http://www.aal.hku.hk/tpg/programme/master-science-computer-science"
        if let link = URL(string: url){
            if #available(iOS 10.0, *) {
                UIApplication.shared.openURL(link)
            } else {
                UIApplication.shared.open(link, options: [:], completionHandler: nil)
            }
        }
    }
    
}
