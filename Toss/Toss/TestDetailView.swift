//
//  TestDetailView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/05.
//

import UIKit
import SnapKit

class TestDetailView: UIViewController {
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "디테일 테스트뷰 입니다"
        label.font = .systemFont(ofSize: 25.0, weight: .bold)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(view.snp.centerY)
        }
    }
}
