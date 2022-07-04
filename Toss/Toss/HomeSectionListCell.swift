//
//  HomeSectionListCell.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/03.
//

import UIKit
import SnapKit

class HomeSectionListCell: UITableViewCell {
    static let height: CGFloat = 95.0
    
    var sectionRow: SectionList?
    
    private lazy var listImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: sectionRow?.image ?? "xmark.octagon")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = sectionRow?.description
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 10.0)
        
        return label
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = sectionRow?.title
        label.font = .systemFont(ofSize: 18.0, weight: .medium)
        
        return label
    }()
    
    func setup(row: SectionList) {
        sectionRow = row
        setupViews()
    }
}

private extension HomeSectionListCell {
    func setupViews() {
        [
            listImageView,
            descriptionLabel,
            mainLabel
        ].forEach { addSubview($0) }
        
        listImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.width.height.equalTo(40.0)
            $0.top.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(listImageView.snp.trailing).offset(20.0)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(listImageView.snp.top)
        }
        
        mainLabel.snp.makeConstraints {
            $0.leading.equalTo(descriptionLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(4.0)
            $0.bottom.equalTo(listImageView.snp.bottom)
        }
    }
}
