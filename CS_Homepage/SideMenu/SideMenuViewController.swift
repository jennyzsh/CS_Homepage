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

class SideMenuViewController: UITableViewController, Menu {

    var delegate: SideMenuViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        preferredContentSize.width = 100
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rect = tableView.rectForRow(at: indexPath)
        var point = CGPoint(x: rect.midX, y: rect.midY)
        point = tableView.convert(point, to: nil)
        delegate?.menu(self, didSelectItemAt: indexPath.row, at: point)
    }
    
    //MARK: - Menu Delegate
    var menuItems: [UIView] {
        return tableView.visibleCells
    }
    
}
