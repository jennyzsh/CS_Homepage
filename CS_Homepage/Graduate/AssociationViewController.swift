//
//  AssociationViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class AssociationViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblContent: KILabel!
    
    let url_string = "https://www.msc-cs.hku.hk/Media/Default/ContentImages/GradDinner2017-2.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Alumni Association"
        
        if let url = URL(string: url_string) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        self.lblContent.text = StringUtility.getStringOf(keyName: "AlumniAssociation")
        self.lblContent.urlLinkTapHandler = KIHandler().linkTapHandler

    }


}
