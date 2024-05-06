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
    let tableLbl : UILabel = {
       let Lbl = UILabel()
        Lbl.text = "검색 결과"
        Lbl.font = UIFont.boldSystemFont(ofSize: 25)
        Lbl.translatesAutoresizingMaskIntoConstraints = false
        return Lbl
    }()
    
    let collectionLbl : UILabel = {
       let Lbl = UILabel()
        Lbl.text = "최근 본 책"
        Lbl.font = UIFont.boldSystemFont(ofSize: 25)
        Lbl.translatesAutoresizingMaskIntoConstraints = false
        return Lbl
    }()
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
        addSubview(tableLbl)
        addSubview(collectionLbl)
        
        SearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([SearchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 50), SearchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor), SearchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionLbl.topAnchor.constraint(equalTo: SearchBar.bottomAnchor, constant: 10),collectionLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),collection.topAnchor.constraint(equalTo: collectionLbl.bottomAnchor, constant: 10), collection.leadingAnchor.constraint(equalTo: self.leadingAnchor), collection.trailingAnchor.constraint(equalTo: self.trailingAnchor), collection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500)])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableLbl.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 10), tableLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),tableView.topAnchor.constraint(equalTo: tableLbl.bottomAnchor, constant: 10), tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
