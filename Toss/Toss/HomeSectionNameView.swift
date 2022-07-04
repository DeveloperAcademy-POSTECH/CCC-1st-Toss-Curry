//
//  HomeSectionNameView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeSectionNameView: UIView {
    var sectionType: HomeSectionType
    
    // TODO: 버튼 터치 시 깜빡임 애니메이션 구현
    private lazy var pushViewButton: UIButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(pushView), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sectionNameLabel: UILabel = {
        let label = UILabel()
        label.text = sectionType.sectionName
        label.font = .systemFont(ofSize: 24.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = sectionType.arrowImage
        
        return imageView
    }()
    
    // TODO: pushView 구현필요
    @objc func pushView() {
        print("Touched HomeSectionNameView")
    }
    
    init(frame: CGRect, type: HomeSectionType) {
        sectionType = type
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeSectionNameView {
    func setupViews() {
        [
            pushViewButton,
            sectionNameLabel,
            arrowImage
        ].forEach { addSubview($0) }
        
        pushViewButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        sectionNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview()
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalTo(sectionNameLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(24.0)
        }
    }
}
