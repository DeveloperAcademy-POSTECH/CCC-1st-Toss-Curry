//
//  HomeSectionView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeSectionView: UIView {
    weak var nameViewDelegate: HomeSectionNameViewDelegate?
    weak var listViewDelegate: HomeSectionListViewDelegate?
    
    var sectionData: TossData
    
    // TODO: homeSectionNameView, homeSectionListView를 stackView 밖에서 구현하기
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let homeSectionNameView = HomeSectionNameView(frame: .zero, type: sectionData.sectionType)
        let homeSectionListView = HomeSectionListView(frame: .zero, type: sectionData.sectionType, list: sectionData.sectionList)
        
        homeSectionNameView.delegate = self
        homeSectionListView.delegate = self
        
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

// TODO: Delegate끼리 연결하기 구현
extension HomeSectionView: HomeSectionNameViewDelegate {
    func pushTossBankView(type: HomeSectionType) {
        nameViewDelegate?.pushTossBankView(type: type)
    }
}

extension HomeSectionView: HomeSectionListViewDelegate {
    func pushInfoView(sectionType: HomeSectionType, consumeType: ConsumeType) {
        listViewDelegate?.pushInfoView(sectionType: sectionType, consumeType: consumeType)
    }
}
