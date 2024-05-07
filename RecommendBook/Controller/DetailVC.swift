//
//  DetailVC.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/3/24.
//

import UIKit
protocol alertPresent {
    func alertP(_ title : Book)
}

class DetailVC : UIViewController {
    private let detailView = DetailView()
    let API = APIDataManager()
    let CDM = CoreDataManager()
    var alertDelegate : alertPresent?
    var current = Book(authors: [], contents: "", isbn: "", price: 0, thumbnail: "", title: "")
    
    override func loadView() {
        view = detailView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        API.readImage(current.thumbnail) { [weak self]book in
            switch book {
            case .success(let thumbnail) :
                DispatchQueue.main.async {
                    self?.detailView.thumbnail.image = UIImage(data: thumbnail)
                }
                
            case .failure(let error) :
                print(error)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        okcancelAction()
        self.detailView.priceLbl.text = String(self.current.price) + "원"
        self.detailView.contentsLbl.text = String(self.current.contents)
        self.detailView.titleLbl.text = current.title
        self.view.backgroundColor = UIColor.white
    }
    private func okcancelAction() {
        detailView.okBtn.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        detailView.xBtn.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    @objc func okAction() {
        self.dismiss(animated: true)
        if let delegate = alertDelegate {
            alertDelegate?.alertP(current)
        }
        
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true)
    }
}
