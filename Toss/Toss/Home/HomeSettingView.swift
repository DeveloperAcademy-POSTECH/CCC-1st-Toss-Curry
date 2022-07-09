//
//  HomeSettingView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/09.
//

import UIKit
import SnapKit

class HomeSettingView: UIView {
    let contentView = UIView()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15.0
        
        let hidingSumButton: UIButton = {
            let button = UIButton()
            button.setTitle("금액 숨기기", for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
            
            return button
        }()
        
        let addingAssetButton: UIButton = {
            let button = UIButton()
            button.setTitle("자산 추가", for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
            
            return button
        }()
        
        let separtorLineView = UIView()
        separtorLineView.backgroundColor = .gray
        
        separtorLineView.snp.makeConstraints {
            $0.height.equalTo(12.0)
            $0.width.equalTo(1.0)
        }
        
        [
            hidingSumButton,
            separtorLineView,
            addingAssetButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HomeSettingView {
    func setupView() {
        addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(80.0)
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(20.0)
        }
    }
}
