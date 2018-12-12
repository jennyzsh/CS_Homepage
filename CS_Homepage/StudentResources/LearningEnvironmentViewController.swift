//
//  LearningEnvironmentViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class LearningEnvironmentViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationItem.title = "Learning Environment"
        super.viewDidLoad()

    }
    
    //present LearningEnvironmentDetailsViewController
    func navigateToDetailPage(with key: String, button: UIButton){
        let content = storyboard?.instantiateViewController(withIdentifier: "LearningEnvironmentDetailsViewController") as! LearningEnvironmentDetailsViewController
        content.background_color = button.backgroundColor!
        content.key = key
        self.navigationController?.present(content, animated: true, completion: nil)
    }

    //MARK: - button click methods
    @IBAction func didPressBtn1(_ sender: UIButton) {
        self.navigateToDetailPage(with: "MScProgrammeOffice", button: sender)
    }
    
    @IBAction func didPressBtn2(_ sender: UIButton) {
        self.navigateToDetailPage(with: "ITS", button: sender)
    }
    
    @IBAction func didPressBtn3(_ sender: UIButton) {
        self.navigateToDetailPage(with: "MScAlumniAssociation", button: sender)
    }
    
    @IBAction func didPressBtn4(_ sender: UIButton) {
        self.navigateToDetailPage(with: "ResearchGroups", button: sender)
    }
    
    @IBAction func didPressBtn5(_ sender: UIButton) {
        self.navigateToDetailPage(with: "OtherUniversityServices", button: sender)
    }
}
