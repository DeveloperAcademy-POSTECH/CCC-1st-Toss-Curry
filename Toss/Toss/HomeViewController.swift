//
//  HomeViewController.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

// TODO: 더미데이터 불러오기 및 연결 구현
class HomeViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 11.0
        stackView.layer.cornerRadius = 12.0
        stackView.clipsToBounds = true
        
        let homeSectionView = HomeSectionView(frame: .zero, type: .tossBank)
        
        [homeSectionView].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
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
        setupLayout()
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
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(scrollView.contentLayoutGuide.snp.height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.trailing.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
}
