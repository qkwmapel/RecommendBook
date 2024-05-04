//
//  MainView.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

class MainView : UIView {
    let SearchBar = UISearchBar()
    let tableView = UITableView()
    let tabBar = UITabBar()
    let collection : UICollectionView = {
           
           let layout = UICollectionViewFlowLayout()
           layout.minimumLineSpacing = 10
           
           layout.scrollDirection = .horizontal
           layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
          
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           
           return cv
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func autoLayout() {
        addSubview(SearchBar)
        addSubview(collection)
        addSubview(tableView)
        addSubview(tabBar)
        SearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([SearchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 50), SearchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor), SearchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collection.topAnchor.constraint(equalTo: self.SearchBar.bottomAnchor), collection.leadingAnchor.constraint(equalTo: self.leadingAnchor), collection.trailingAnchor.constraint(equalTo: self.trailingAnchor), collection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500)])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: collection.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)])
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tabBar.topAnchor.constraint(equalTo: tableView.bottomAnchor), tabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),tabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor), tabBar.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
