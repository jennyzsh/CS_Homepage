//
//  FacultyViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit

class FacultyViewController: UIViewController {

    @IBOutlet weak var instructorTableView: UITableView!
    @IBOutlet weak var instructorTableViewConstraintH: NSLayoutConstraint!
    @IBOutlet weak var lblFacultyInfo: UILabel!
    
    let cellIdentifier = "InstructorTableViewCell"
    var instructorsArray:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Faculty"
        self.lblFacultyInfo.text = StringUtility.getStringOf(keyName: "FacultyInfo")
        self.instructorTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.loadJson()
        self.instructorTableViewConstraintH.constant = CGFloat(180 * instructorsArray.count)
        self.instructorTableView.reloadData()
    }
    
    //load instructors.json to get instructors information
    func loadJson() {
        if let path = Bundle.main.path(forResource: "instructors", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let instructors = jsonResult["instructors"] as? [Any] {
                    self.instructorsArray = instructors
                }
            } catch {

            }
        }
    }
}



extension FacultyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.instructorsArray.count
    }
    
    //set up InstructorTableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InstructorTableViewCell
        let instructor = self.instructorsArray[indexPath.row] as! Dictionary<String, AnyObject>
        cell.lblName.text = instructor["name"] as! String
        cell.lblTitle.text = instructor["title"] as! String
        cell.lblFieldOfResearch.text = instructor["field_of_research"] as! String
        cell.lblEmail.text = instructor["email"] as! String
        if let url = URL(string: instructor["photo"] as! String) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.ivPhoto.image = UIImage(data: data)
                    }
                }
            }
        }
        
        return cell
    }
}
