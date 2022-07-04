//
//  HomeSectionView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeSectionView: UIView {
    var sectionType: HomeSectionType
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let homeSectionNameView = HomeSectionNameView(frame: .zero, type: sectionType)
        let homeSectionListView = HomeSectionListView(frame: .zero, type: sectionType)
        
        [
            homeSectionNameView,
            homeSectionListView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    func setupLayout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // Custom Initializer
    init(frame: CGRect, type: HomeSectionType) {
        sectionType = type
        
        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
