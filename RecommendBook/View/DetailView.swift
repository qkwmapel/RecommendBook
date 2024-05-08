//
//  DetailView.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/3/24.
//

import UIKit

class DetailView : UIView {
    let thumbnail : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    let priceLbl : UILabel = {
        let title = UILabel()
        title.sizeToFit()
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    let titleLbl : UILabel = {
        let title = UILabel()
        title.sizeToFit()
        title.font = UIFont.boldSystemFont(ofSize: 25)
        return title
    }()
    let contentsLbl : UILabel = {
        let content = UILabel()
        content.sizeToFit()
        content.lineBreakMode = .byWordWrapping
        content.numberOfLines = 10
        content.font = UIFont.systemFont(ofSize: 15)
        return content
    }()
    private lazy var scrollContents : UIView = {
        let SC = UIView()
        [titleLbl,thumbnail, priceLbl, contentsLbl].forEach{
            SC.addSubview($0)
        }
        return SC
    }()
    private lazy var scrollView : UIScrollView = {
        let SV = UIScrollView()
        SV.addSubview(scrollContents)
        SV.translatesAutoresizingMaskIntoConstraints = false
        return SV
    }()
    let xBtn : UIButton = {
        let Button = UIButton()
        Button.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        Button.setTitle("X", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        Button.layer.cornerRadius = 15
        return Button
    }()
    
    let okBtn : UIButton = {
        let Button = UIButton()
        Button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        Button.setTitle("담기", for: .normal)
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.layer.cornerRadius = 15
        return Button
    }()
    
    private lazy var stackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [xBtn,okBtn])
        stack.spacing = 20
//        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() {
        
    }
    func setConstraints() {
        setScroll()
        setImage()
        setPrice()
        setTitle()
        setContent()
        setStack()
        setScrollContents()
    }
    
    private func setScroll() {
        addSubview(scrollView)
           NSLayoutConstraint.activate([
               scrollView.topAnchor.constraint(equalTo: self.topAnchor),
               scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               // 3
               scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
           ])
    }
    
    private func setScrollContents() {
        scrollContents.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([scrollContents.topAnchor.constraint(equalTo: scrollView.topAnchor), scrollContents.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor), scrollContents.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor), scrollContents.heightAnchor.constraint(equalToConstant: CGFloat(thumbnail.frame.height + priceLbl.frame.height + contentsLbl.frame.height + 50 + titleLbl.frame.height)), scrollContents.widthAnchor.constraint(equalTo: scrollView.widthAnchor)])
    }
    func setTitle() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleLbl.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor), titleLbl.topAnchor.constraint(equalTo: scrollContents.topAnchor,constant: 10)])
    }
    private func setImage() {
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([thumbnail.topAnchor.constraint(equalTo: titleLbl.bottomAnchor,constant: 10), thumbnail.leadingAnchor.constraint(equalTo: scrollContents.leadingAnchor), thumbnail.trailingAnchor.constraint(equalTo: scrollContents.trailingAnchor), thumbnail.heightAnchor.constraint(equalToConstant: 300)])
    }
    
    private func setPrice() {
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([priceLbl.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 15), priceLbl.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
    }
    
    private func setContent() {
        contentsLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([contentsLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 15), contentsLbl.leadingAnchor.constraint(equalTo: scrollContents.leadingAnchor,constant: 15), contentsLbl.trailingAnchor.constraint(equalTo: scrollContents.trailingAnchor,constant: -15)])
    }
    
    private func setStack() {
        addSubview(stackView)
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor), stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 15), stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15), stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -30)])
    }
    
    
}
