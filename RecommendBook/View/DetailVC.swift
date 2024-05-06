//
//  DetailVC.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/3/24.
//

import UIKit

class DetailVC : UIViewController {
    private let detailView = DetailView()
    let API = APIDataManager()
    let current = Book(authors: [], contents: "", isbn: "", price: 0, thumbnail: "", title: "")
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.readImage(current.thumbnail) { book in
            switch book {
            case .success(let thumbnail) :
                self.detailView.thumbnail.image = UIImage(data: thumbnail)
            case .failure(let error) :
                print(error)
            }
        }
        detailView.titleLbl.text = current.title
        detailView.contentsLbl.text = current.contents
        self.view.backgroundColor = UIColor.white
    }
}
