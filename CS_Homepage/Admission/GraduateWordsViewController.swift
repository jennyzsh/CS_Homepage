//
//  GraduateWordsViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/16.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import KILabel

class GraduateWordsViewController: UITableViewController {

    @IBOutlet weak var lblHeader: KILabel!
    
    var graduates_array:[Dictionary<String, AnyObject>] = []
    
    let cellIdentifier = "GraduateWordsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.navigationItem.title = "Graduate Words"
        self.lblHeader.text = StringUtility.getStringOf(keyName: "GraduateWordsHeader")
        self.lblHeader.urlLinkTapHandler = KIHandler().linkTapHandler

        self.loadJson()
    }
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "graduates", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let graduates = jsonResult["graduates"] as? [Dictionary<String, AnyObject>] {
                    self.graduates_array = graduates
                }
            } catch {
                
            }
        }
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = storyboard?.instantiateViewController(withIdentifier: "GraduateWordsDetailViewController") as! GraduateWordsDetailViewController
        let graduate = self.graduates_array[indexPath.row]
        content.graduate = graduate
        self.navigationController?.present(content, animated: true, completion: nil)
    }
    
    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.graduates_array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! GraduateWordsTableViewCell
        
        let graduate = self.graduates_array[indexPath.row]
        cell.lblName.text = graduate["name"] as! String
        cell.lblYearOfGraduate.text = graduate["year_of_graduate"] as! String
        if let url = URL(string: graduate["photo"] as! String) {
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
