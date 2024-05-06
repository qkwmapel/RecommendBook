//
//  WishCell.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/6/24.
//

import UIKit

class WishCell: UITableViewCell {
    static let identifier = "WishCell"
    
    let titleLbl : UILabel = {
       let Lbl = UILabel()
        Lbl.font = UIFont.boldSystemFont(ofSize: 17)
        Lbl.translatesAutoresizingMaskIntoConstraints = false
        return Lbl
    }()
    let authorLbl : UILabel = {
       let Lbl = UILabel()
        Lbl.font = UIFont.systemFont(ofSize: 10)
        Lbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        Lbl.translatesAutoresizingMaskIntoConstraints = false
        return Lbl
    }()
    
    let priceLbl : UILabel = {
       let Lbl = UILabel()
        Lbl.font = UIFont.systemFont(ofSize: 10)
        Lbl.translatesAutoresizingMaskIntoConstraints = false
        return Lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        addSubview(titleLbl)
        
        NSLayoutConstraint.activate([titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor), titleLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10)])
        
        addSubview(authorLbl)
        
        NSLayoutConstraint.activate([authorLbl.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor), authorLbl.leadingAnchor.constraint(equalTo: titleLbl.trailingAnchor, constant: 15)])
        
        addSubview(priceLbl)
        
        NSLayoutConstraint.activate([priceLbl.centerYAnchor.constraint(equalTo: authorLbl.centerYAnchor), priceLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)])
    }
}
