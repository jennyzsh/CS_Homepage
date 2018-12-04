//
//  CompCoursesViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/19.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class CompCoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblFooter: UILabel!
    
    let cellIdentifier = "CompCoursesTableViewCell"
    var courses_dic = Dictionary<String, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Courses"
        self.lblHeader.text = StringUtility.getStringOf(keyName: "CompHeader")
        self.lblFooter.text = StringUtility.getStringOf(keyName: "CompFooter")
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.loadJson()
    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "courses", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                    self.courses_dic = jsonResult
                }
            } catch {
                
            }
        }
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.courses_dic.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(self.courses_dic.keys)[section]
        let courses_array = (self.courses_dic[key]!["courses"] as! NSArray) as Array
        return courses_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CompCoursesTableViewCell
        let key = Array(self.courses_dic.keys)[indexPath.section]
        let courses_array = (self.courses_dic[key]!["courses"] as! NSArray) as Array
        cell.lblTitle.text = courses_array[indexPath.row]["name"] as! String
        cell.lblDesc.text = courses_array[indexPath.row]["desc"] as! String
        cell.backgroundColor = UIColor(hexString: self.courses_dic[key]!["cell_bg_color"] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = Array(self.courses_dic.keys)[section]
        return key
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let key = Array(self.courses_dic.keys)[section]
        view.tintColor = UIColor(hexString: self.courses_dic[key]!["header_bg_color"] as! String)
    }
    
}
