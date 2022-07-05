//
//  HomeSectionListView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/03.
//

import UIKit
import SnapKit

class HomeSectionListView: UIView {
    var sectionList: [SectionList]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.rowHeight = 95.0
        tableView.separatorStyle = {
            if sectionList.count == 1 {
                return .none
            } else {
                return .singleLine
            }
        }()
        tableView.separatorInset = UIEdgeInsets(top: 8.0, left: 24.0, bottom: 8.0, right: 24.0)
        tableView.layer.cornerRadius = 15.0
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeSectionListCell.self, forCellReuseIdentifier: "HomeSectionListCell")
        
        return tableView
    }()
        
    init(frame: CGRect, list: [SectionList]) {
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
        print("touched \(indexPath.row) row")
        
    }
}

extension HomeSectionListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSectionListCell", for: indexPath) as? HomeSectionListCell
        
        cell?.setup(row: sectionList[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
