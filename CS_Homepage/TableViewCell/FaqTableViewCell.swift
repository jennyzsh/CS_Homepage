//
//  FaqTableViewCell.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class FaqTableViewCell: UITableViewCell {

    @IBOutlet weak var lblQuestion: KILabel!
    @IBOutlet weak var lblAnswer: KILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
