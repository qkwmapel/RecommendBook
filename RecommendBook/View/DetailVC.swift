//
//  DetailVC.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/3/24.
//

import UIKit

class DetailVC : UIViewController {
    private let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
}
