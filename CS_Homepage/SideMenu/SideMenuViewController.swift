//
//  SideMenuViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import SideMenu

protocol SideMenuViewControllerDelegate {
    func menu(_ menu: SideMenuViewController, didSelectItemAt index: Int, at point: CGPoint)
    func menuDidCancel(_ menu: SideMenuViewController)
}

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Menu {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "SideMenuTableViewCell"
    var delegate: SideMenuViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let rect = tableView.rectForRow(at: indexPath)
        var point = CGPoint(x: rect.midX, y: rect.midY)
        point = tableView.convert(point, to: nil)
        delegate?.menu(self, didSelectItemAt: indexPath.row, at: point)
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SideMenuTableViewCell
        cell.lblTitle.text = "\(indexPath.row)"
        return cell
    }
    
    //MARK: - Menu Delegate
    var menuItems: [UIView] {
        return tableView.visibleCells
    }
    
}
