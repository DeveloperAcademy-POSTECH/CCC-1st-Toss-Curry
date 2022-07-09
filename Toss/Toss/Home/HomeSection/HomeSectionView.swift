//
//  HomeSectionView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeSectionView: UIView {
    weak var nameViewdelegate: HomeSectionNameViewDelegate?
    
    var sectionData: TossData
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let homeSectionNameView = HomeSectionNameView(frame: .zero, type: sectionData.sectionType)
        let homeSectionListView = HomeSectionListView(frame: .zero, type: sectionData.sectionType, list: sectionData.sectionList)
        
        homeSectionNameView.delegate = self
        
        [
            homeSectionNameView,
            homeSectionListView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    // Custom Initializer
    init(frame: CGRect, sectionData: TossData) {
        self.sectionData = sectionData

        super.init(frame: frame)
        
        addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.layer.cornerRadius = 15.0
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeSectionView: HomeSectionNameViewDelegate {
    func pushTossBankView(type: HomeSectionType) {
        nameViewdelegate?.pushTossBankView(type: type)
    }
}
