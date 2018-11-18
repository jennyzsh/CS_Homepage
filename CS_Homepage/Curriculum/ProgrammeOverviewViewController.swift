//
//  ProgrammeOverviewViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class ProgrammeOverviewViewController: UIViewController {
    
    @IBOutlet weak var lblProgrammeOverview1: UILabel!
    @IBOutlet weak var lblProgrammeOverview2: UILabel!
    @IBOutlet weak var lblProgrammeOverview3: UILabel!
    @IBOutlet weak var lblProgrammeOverview4: UILabel!
    @IBOutlet weak var lblProgrammeOverview5: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var lblStudyStream1: UILabel!
    @IBOutlet weak var lblStudyStream2: UILabel!
    @IBOutlet weak var lblStudyStream3: UILabel!
    @IBOutlet weak var lblStudyStream4: UILabel!
    
    let url1_string = "https://www.msc-cs.hku.hk/Media/Default/ContentImages/InformationSecurity.jpg"
    let url2_string = "https://www.msc-cs.hku.hk/Media/Default/ContentImages/MultimediaComputing.jpg"
    let url3_string = "https://www.msc-cs.hku.hk/Media/Default/ContentImages/FinancialComputing.jpg"
    let url4_string = "https://www.msc-cs.hku.hk/Media/Default/ContentImages/GeneralStream.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    func setupLayout() {
        self.lblProgrammeOverview1.text = StringUtility.getStringOf(keyName: "ProgrammeOverview1")
        self.lblProgrammeOverview2.text = StringUtility.getStringOf(keyName: "ProgrammeOverview2")
        self.lblProgrammeOverview3.text = StringUtility.getStringOf(keyName: "ProgrammeOverview3")
        self.lblProgrammeOverview4.text = StringUtility.getStringOf(keyName: "ProgrammeOverview4")
        self.lblProgrammeOverview5.text = StringUtility.getStringOf(keyName: "ProgrammeOverview5")
        self.lblStudyStream1.text = StringUtility.getStringOf(keyName: "ProgrammeOverviewCyberSecurity")
        self.lblStudyStream2.text = StringUtility.getStringOf(keyName: "ProgrammeOverviewMultimediaComputing")
        self.lblStudyStream3.text = StringUtility.getStringOf(keyName: "ProgrammeOverviewFinancialComputing")
        self.lblStudyStream4.text = StringUtility.getStringOf(keyName: "ProgrammeOverviewGeneralStream")
        
        if let url1 = URL(string: url1_string) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url1) {
                    DispatchQueue.main.async {
                        self.imageView1.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let url2 = URL(string: url2_string) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url2) {
                    DispatchQueue.main.async {
                        self.imageView2.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let url3 = URL(string: url3_string) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url3) {
                    DispatchQueue.main.async {
                        self.imageView3.image = UIImage(data: data)
                    }
                }
            }
        }
        
        if let url4 = URL(string: url4_string) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url4) {
                    DispatchQueue.main.async {
                        self.imageView4.image = UIImage(data: data)
                    }
                }
            }
        }

    }


}
