//
//  HomeViewController.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var plusBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: nil)
        
        return button
    }()
    
    private lazy var chatBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: nil)
        
        return button
    }()
    
    private lazy var alarmBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: nil)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
}

private extension HomeViewController {
    func setupNavigationBar() {
        navigationItem.title = "toss"
        
        navigationItem.rightBarButtonItems = [
            alarmBarButton,
            chatBarButton,
            plusBarButton
        ]
    }
}
