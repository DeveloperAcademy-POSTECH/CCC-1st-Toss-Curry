//
//  HomeSectionListView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/03.
//

import UIKit
import SnapKit

class HomeSectionListView: UIView {
    weak var delegate: HomeSectionListViewDelegate?
    
    var sectionType: HomeSectionType
    var sectionList: [SectionList]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.rowHeight = 95.0

        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 8.0, left: 24.0, bottom: 8.0, right: 24.0)
        tableView.layer.cornerRadius = 15.0
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeSectionListCell.self, forCellReuseIdentifier: "HomeSectionListCell")
        
        return tableView
    }()
        
    init(frame: CGRect, type: HomeSectionType, list: [SectionList]) {
        sectionType = type
        sectionList = list
        
        super.init(frame: frame)
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(HomeSectionListCell.height * CGFloat(sectionList.count))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeSectionListView: UITableViewDelegate {
    // TODO: show View 구현
    // TODO: 터치 시 그림자 안사라지는 오류 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.pushInfoView(sectionType: sectionType, consumeType: sectionList[indexPath.row].type)
    }
    
}

extension HomeSectionListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSectionListCell", for: indexPath) as? HomeSectionListCell
        
        if indexPath.row == sectionList.count - 1 {
            DispatchQueue.main.async {
                cell?.addAboveTheBottomBorderWithColor(color: .white)
            }
        }
        cell?.setup(row: sectionList[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}

// 출처 : https://ios-development.tistory.com/215
public extension UIView {
    func addBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }

    func addAboveTheBottomBorderWithColor(color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
    }
}

// TODO: ListView에 데이터 연결 필요
protocol HomeSectionListViewDelegate: AnyObject {
    func pushInfoView(sectionType: HomeSectionType, consumeType: ConsumeType)
}
