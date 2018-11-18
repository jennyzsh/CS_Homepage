//
//  FaqTableViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/18.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class FaqTableViewController: UITableViewController {
    
    var faq_dic: Dictionary<String, AnyObject> = Dictionary()
    let cellIdentifier = "FaqTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FAQ"
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.loadJson()
    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "faq", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    self.faq_dic = jsonResult
                }
            } catch {
                
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.faq_dic.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(self.faq_dic.keys)[section]
        let faq_array = (self.faq_dic[key] as! NSArray) as Array
        return faq_array.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = Array(self.faq_dic.keys)[section]
        return key
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FaqTableViewCell
        let key = Array(self.faq_dic.keys)[indexPath.section]
        let faq_array = (self.faq_dic[key] as! NSArray) as Array
        cell.lblQuestion.text = faq_array[indexPath.row]["question"] as! String
        cell.lblAnswer.text = faq_array[indexPath.row]["answer"] as! String
        cell.lblAnswer.urlLinkTapHandler = KIHandler().linkTapHandler
        return cell
    }

}
