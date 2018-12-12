//
//  SubmenuViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class SubmenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewConstraintH: NSLayoutConstraint!
    
    let cellIdentifier = "SubmenuTableViewCell"
    var dic: Dictionary<String, AnyObject>!
    var submenu_array: Array<AnyObject>! = []
    var menu_type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.loadJson()
        self.navigationItem.title = dic["title"] as! String
        self.tableViewConstraintH.constant = CGFloat(100 * self.submenu_array.count)
    }
    
    //load menu.json to get submenus
    func loadJson() {
        if let path = Bundle.main.path(forResource: "menu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let dic = jsonResult[menu_type] as? Dictionary<String, AnyObject> {
                    self.dic = dic
                    self.submenu_array = dic["submenu"] as! Array
                }
            } catch {
                
            }
        }
    }
}

//UITableViewDelegate
extension SubmenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = storyboard?.instantiateViewController(withIdentifier: self.submenu_array[indexPath.row]["view_controller"] as! String)
        self.navigationController?.setViewControllers([content!], animated: true)
    }
}

//UITableViewDataSource
extension SubmenuViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.submenu_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SubmenuTableViewCell
        cell.lblTitle.text = self.submenu_array[indexPath.row]["title"] as! String
        return cell
    }
}
