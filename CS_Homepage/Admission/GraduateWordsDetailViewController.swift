//
//  GraduateWordsDetailViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class GraduateWordsDetailViewController: UIViewController {
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblYearOfGraduate: UILabel!
    @IBOutlet weak var lblWords: UILabel!
    
    var graduate: Dictionary<String,AnyObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Graduate Words"
        self.setupLayout()
    }

    @IBAction func didPressBtnClose(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        self.lblName.text = graduate["name"] as! String
        self.lblYearOfGraduate.text = graduate["year_of_graduate"] as! String
        self.lblWords.text = graduate["words"] as! String
        if let url = URL(string: graduate["photo"] as! String) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.ivPhoto.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
