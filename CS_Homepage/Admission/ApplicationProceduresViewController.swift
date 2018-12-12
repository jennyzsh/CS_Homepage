//
//  ApplicationProceduresViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class ApplicationProceduresViewController: UIViewController {

    @IBOutlet weak var lblContent1: KILabel!
    @IBOutlet weak var lblContent2: KILabel!
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var lblContent3: KILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webview.scrollView.isScrollEnabled = false
        
        self.navigationItem.title = "Application Procedures"
        self.lblContent1.text = StringUtility.getStringOf(keyName: "ApplicationProcedure1")
        self.lblContent1.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.lblContent2.text = StringUtility.getStringOf(keyName: "ApplicationProcedure2")
        self.lblContent2.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.lblContent3.text = StringUtility.getStringOf(keyName: "ApplicationProcedure3")
        self.lblContent3.urlLinkTapHandler = KIHandler().linkTapHandler
        
        self.loadHTML()
        
    }
    
    //load application_procedure_table.html to display the table
    func loadHTML() {
        if let url = Bundle.main.path(forResource: "application_procedure_table", ofType: "html") {
            do {
                let contents =  try String(contentsOfFile: url, encoding: .utf8)
                webview.loadHTMLString(contents as String, baseURL: nil)
            } catch {
                
            }
        }
    }

    //open browser externally when click the button
    @IBAction func didPressBtnOnlineApplication(_ sender: UIButton) {
        let url = "http://www.aal.hku.hk/tpg/programme/master-science-computer-science"
        if let link = URL(string: url){
            UIApplication.shared.openURL(link)
        }
    }
    
}
