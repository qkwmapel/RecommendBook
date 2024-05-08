//
//  MainViewController.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

class MainVC : UIViewController {
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
}
