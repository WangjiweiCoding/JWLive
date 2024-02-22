//
//  XXTabbarController.swift
//  socrates
//
//  Created by wangjiwei on 2/22/24.
//

import Foundation
import UIKit

class XXTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTheme()
        prepareContents()
    }
    
    private func prepareTheme() {
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .lightGray
            tabBar.scrollEdgeAppearance = appearance
            tabBar.standardAppearance = appearance
        }
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    private func prepareContents() {
        let vc = XXHomeViewController()
        addChildren(vc: vc, title: "页面1", norIcon: "", selIcon: "")
        
        let vc2 = XXHomeViewController()
        vc2.view.backgroundColor = .blue
        addChildren(vc: vc2, title: "页面2", norIcon: "", selIcon: "")
        
        let vc3 = XXHomeViewController()
        vc3.view.backgroundColor = .yellow
        addChildren(vc: vc3, title: "页面3", norIcon: "", selIcon: "")
        
        let vc4 = XXHomeViewController()
        vc4.view.backgroundColor = .green
        addChildren(vc: vc4, title: "页面4", norIcon: "", selIcon: "")
    }
    
    private func addChildren(vc:UIViewController, title:String,norIcon:String,selIcon:String) {
        let norImg = UIImage(named: norIcon)
        let selImg = UIImage(named: selIcon)
        vc.tabBarItem.image = norImg
        vc.tabBarItem.selectedImage = selImg
        vc.title = title
        let nav = XXNavigationController(rootViewController: vc)
        addChild(nav)
    }
}


