//
//  KILinkTapHandler.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

//KIHandler to handle the link in KILabel
class KIHandler: NSObject {
    
    var linkTapHandler: KILinkTapHandler = { label, url, range in
        var link = url
        if url.isValidEmail() {
            link = "mailto:" + url
        }
        if let link = URL(string: url){
            UIApplication.shared.openURL(link)
        }
    }

}
