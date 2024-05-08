//
//  WishBook.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/6/24.
//

import UIKit

class WishBook : UIView {
    let deleteBtn : UIButton = {
        let Btn = UIButton()
        Btn.setTitle("전체 삭제", for: .normal)
        Btn.setTitleColor(UIColor.systemGray5, for: .normal)
        Btn.translatesAutoresizingMaskIntoConstraints = false
        return Btn
    }()
    
    let titleLbl : UILabel = {
        let Lbl = UILabel()
        Lbl.text = "담은 책"
        Lbl.textAlignment = .center
        Lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return Lbl
    }()
    
    
    var addBtn : UIButton = {
        let Btn = UIButton()
        Btn.setTitle("추가", for: .normal)
        let addColor : UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        Btn.setTitleColor(addColor, for: .normal)
        Btn.translatesAutoresizingMaskIntoConstraints = false
        return Btn
    }()
    
    private lazy var stackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [deleteBtn, titleLbl, addBtn])
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let tableView : UITableView = {
        let table = UITableView()
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setconstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setconstraints() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50), stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10), stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor), stackView.heightAnchor.constraint(equalToConstant: 50), deleteBtn.widthAnchor.constraint(equalToConstant: 80), addBtn.widthAnchor.constraint(equalToConstant: 80)])
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor), tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor), tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}


