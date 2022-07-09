//
//  HomeViewController.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    var data: [TossData] = []
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 11.0
        
        let tossSectionView = HomeSectionView(frame: .zero, sectionData: data[0])
        let assetSectionView = HomeSectionView(frame: .zero, sectionData: data[1])
        let consumeSectionView = HomeSectionView(frame: .zero, sectionData: data[2])
        let homeInformationView = HomeInformationView(frame: .zero)
        let homeSettingView = HomeSettingView(frame: .zero)
        
        [
            tossSectionView,
            assetSectionView,
            consumeSectionView,
            homeInformationView,
            homeSettingView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var plusBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(pushView))
        button.tintColor = .lightGray
        
        return button
    }()
    
    private lazy var chatBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(pushView))
        button.tintColor = .lightGray
        
        return button
    }()
    
    private lazy var alarmBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(pushView))
        button.tintColor = .lightGray
        
        return button
    }()
    
    private lazy var titleButton: UIBarButtonItem = {
        let image = UIImage(named: "TossLogo")?.resizeTo(size: CGSize(width: 120.0, height: 300.0))
        let button = UIButton()
        button.setBackgroundImage(image, for: .normal)
        
        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = .lightGray
        
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = dummyData
        
        setupNavigationBar()
        setupLayout()
    }
}

private extension HomeViewController {
    func setupNavigationBar() {
        navigationItem.rightBarButtonItems = [
            alarmBarButton,
            chatBarButton,
            plusBarButton
        ]
        
        navigationItem.leftBarButtonItem = titleButton
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithDefaultBackground()
        navigationAppearance.backgroundEffect = UIBlurEffect(style: .light)
        navigationAppearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = navigationAppearance

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
    
    @objc func pushView() {
        self.navigationController?.pushViewController(TestDetailView(), animated: true)
    }
}

// 출처 : jeohong (https://github.com/DeveloperAcademy-POSTECH/CCC-1st-Toss-Chikong/blob/UI/Toss/Toss/ViewController.swift)
extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let rendered = UIGraphicsImageRenderer(size: size)
        let image = rendered.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}
