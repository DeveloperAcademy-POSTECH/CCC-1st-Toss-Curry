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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
        
    init(frame: CGRect, type: HomeSectionType) {
        sectionType = type
        
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeSectionListView: UITableViewDelegate {
    // TODO: show View 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched \(indexPath.row) row")
    }
}

extension HomeSectionListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    // TODO: sectionList Cell 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
}
