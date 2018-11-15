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
    fileprivate var selectedIndex = 0
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

}

extension ViewController: SideMenuViewControllerDelegate {
    func menuDidCancel(_ menu: SideMenuViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func menu(_ menu: SideMenuViewController, didSelectItemAt index: Int, at point: CGPoint) {
        transitionPoint = point
        selectedIndex = index
        
        let content = storyboard?.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        
        navigator.setViewControllers([content], animated: true)
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension ViewController: UINavigationControllerDelegate {
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
