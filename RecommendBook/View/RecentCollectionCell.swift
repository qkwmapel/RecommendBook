//
//  RecentCollectionCell.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/7/24.
//

import UIKit

class RecentCollectionCell: UICollectionViewCell {
    static let identifier = "RecentCollectionCell"
    
    let thumbnail : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        addSubview(thumbnail)
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([thumbnail.topAnchor.constraint(equalTo: self.topAnchor,constant: 5), thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor), thumbnail.trailingAnchor.constraint(equalTo: self.trailingAnchor), thumbnail.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: -5)])
    }
}
