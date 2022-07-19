//
//  HomeInformationCell.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/04.
//

import UIKit
import SnapKit

class HomeInformationCell: UICollectionViewCell {
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    func setup() {
        subTitleLabel.text = "1분 만에"
        titleLabel.text = "신용 점수 올리기"
        imageView.image = UIImage(named: "InformationImage")
        
        let attrString = NSMutableAttributedString(string: titleLabel.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4.0
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        
        titleLabel.attributedText = attrString
        
        setupView()
    }
}

private extension HomeInformationCell {
    func setupView() {
        [
            subTitleLabel,
            titleLabel,
            imageView
        ].forEach { addSubview($0) }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20.0)
            $0.top.equalToSuperview().inset(24.0)
            $0.width.equalTo(100.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel.snp.leading)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(12.0)
            $0.width.equalTo(80.0)
            $0.height.equalTo(50.0)
        }
        
        imageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
    }
}
