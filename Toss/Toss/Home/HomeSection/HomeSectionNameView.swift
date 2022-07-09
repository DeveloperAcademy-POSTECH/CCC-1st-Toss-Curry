//
//  HomeSectionNameView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit
import SnapKit

class HomeSectionNameView: UIView {
    weak var delegate: HomeSectionNameViewDelegate?
    
    var sectionType: HomeSectionType
    
    private lazy var pushViewButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.cornerStyle = .medium
        
        var pushButton = UIButton(configuration: config, primaryAction: UIAction(handler: { _ in
            self.delegate?.pushTossBankView(type: self.sectionType)
        }))
        
        pushButton.configurationUpdateHandler = { button in
            switch button.state {
            case .highlighted:
                button.configuration?.baseBackgroundColor = UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1.0)
            default:
                button.configuration?.baseBackgroundColor = .white
            }
        }
        
        return pushButton
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
    
    init(frame: CGRect, type: HomeSectionType) {
        sectionType = type
        
        super.init(frame: frame)
        self.layer.cornerRadius = 15.0
        
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

protocol HomeSectionNameViewDelegate: AnyObject {
    func pushTossBankView(type: HomeSectionType)
}
