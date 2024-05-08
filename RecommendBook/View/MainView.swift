//
//  MainView.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

class MainView : UIView {
    let SearchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "검색어를 입력해주세요"
        search.searchBarStyle = .minimal
        return search
    }()
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.sectionHeaderTopPadding = 3
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func autoLayout() {
        addSubview(SearchBar)
        addSubview(tableView)
        
        SearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([SearchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 50), SearchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor), SearchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: SearchBar.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10), tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
