//
//  TabBarController.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {
    
    private lazy var homeViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: HomeViewController())
        let tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            tag: 1
        )
        
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            homeViewController
        ]
        
        tabBar.tintColor = .label
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 20.0
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.2
    }
}
