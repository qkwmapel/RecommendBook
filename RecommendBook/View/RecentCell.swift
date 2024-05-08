//
//  RecentCell.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/7/24.
//

import UIKit
protocol selectCell {
    func detailP(_ title: Book)
}

class RecentCell: UITableViewCell {
    static let identifier = "RecentCell"
    let API = APIDataManager()
    var detail : selectCell?
    lazy var collection : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    var recentList = [Book]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collection.delegate = self
        collection.dataSource = self
        collection.register(RecentCollectionCell.self, forCellWithReuseIdentifier: RecentCollectionCell.identifier)
        setCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCollection() {
        contentView.addSubview(collection)
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor),collection.leadingAnchor.constraint(equalTo: self.leadingAnchor), collection.trailingAnchor.constraint(equalTo: self.trailingAnchor), collection.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
}

extension RecentCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: RecentCollectionCell.identifier, for: indexPath) as? RecentCollectionCell else { return UICollectionViewCell()}
        API.readImage(recentList[indexPath.row].thumbnail) { recent in
            switch recent {
            case .success(let data) :
                DispatchQueue.main.async {
                    cell.thumbnail.image = UIImage(data: data)
                }
            case .failure(let error) :
                print(error)
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detail = detail {
            detail.detailP(recentList[indexPath.row])
        }
    }
    
}
