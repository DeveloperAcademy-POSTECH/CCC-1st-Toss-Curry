//
//  TossBankView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/10.
//

import UIKit
import SnapKit

class TossBankView: UIViewController {
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "TossBankView 입니다"
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
