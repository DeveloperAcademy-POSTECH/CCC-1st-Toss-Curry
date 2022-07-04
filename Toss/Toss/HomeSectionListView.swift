//
//  HomeSectionListView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/03.
//

import UIKit
import SnapKit

class HomeSectionListView: UIView {
    var sectionType: HomeSectionType
    
    // TODO: row가 1개일 경우 separator가 보이지 않도록 구현
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.rowHeight = 95.0
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(HomeSectionListCell.self, forCellReuseIdentifier: "HomeSectionListCell")
        
        return tableView
    }()
        
    init(frame: CGRect, type: HomeSectionType) {
        sectionType = type
        
        super.init(frame: frame)
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(HomeSectionListCell.height)
        }
        
        tableView.reloadData()
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
    // TODO: 데이터 갯수에 따라 변화되도록 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSectionListCell", for: indexPath) as? HomeSectionListCell
        
        cell?.setup(type: sectionType)
        
        return cell ?? UITableViewCell()
    }
}
