//
//  ViewController.swift
//  CS_Homepage
//
//  Created by Jenny ZHANG on 2018/11/15.
//  Copyright © 2018年 Jenny ZHANG. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    fileprivate var transitionPoint: CGPoint!
    fileprivate var navigator: UINavigationController!

    
    lazy fileprivate var menuAnimator: MenuTransitionAnimator! = MenuTransitionAnimator(mode: .presentation, shouldPassEventsOutsideMenu: false) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case (.some("presentMenu"), let menu as SideMenuViewController):
            menu.delegate = self
            menu.transitioningDelegate = self
            menu.modalPresentationStyle = .custom
        case (.some("embedNavigator"), let navigator as UINavigationController):
            self.navigator = navigator
            self.navigator.delegate = self
        default:
            super.prepare(for: segue, sender: sender)
        }
    }

    @IBAction func clickToHomePage(_ sender: UIButton) {
        let content = storyboard?.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController
        navigator.setViewControllers([content], animated: true)
    }
}

//SideMenuViewControllerDelegate
extension ViewController: SideMenuViewControllerDelegate {
    //menu did cancel
    func menuDidCancel(_ menu: SideMenuViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //menu did select
    func menu(_ menu: SideMenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
        transitionPoint = point
        
        let content = storyboard?.instantiateViewController(withIdentifier: "SubmenuViewController") as! SubmenuViewController
        
        switch index {
        case 0:
            content.menu_type = "about"
        case 1:
            content.menu_type = "admission"
        case 2:
            content.menu_type = "curriculum"
        case 3:
            content.menu_type = "graduate"
        case 4:
            content.menu_type = "student_resource"
        default:
            break
        }
        
        navigator.setViewControllers([content], animated: true)
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
    //navigation controller animation
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let transitionPoint = transitionPoint {
            return CircularRevealTransitionAnimator(center: transitionPoint)
        }
        return nil
    }
}


extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MenuTransitionAnimator(mode: .dismissal)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return menuAnimator
    }
}
