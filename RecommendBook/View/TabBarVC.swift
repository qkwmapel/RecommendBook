//
//  TabBarVC.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/6/24.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.white // TabBar 의 배경 색
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)// TabBar Item 이 선택되었을때의 색
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) // TabBar Item 의 기본 색
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        
        let firstViewController = UINavigationController(rootViewController: MainViewController())
        firstViewController.tabBarItem.title = "검색 탭" // TabBar Item 의 이름
        
        let secondViewController = UINavigationController(rootViewController: WishBookVC())
        secondViewController.tabBarItem.title = "담은 책 리스트 탭"
        
        viewControllers = [firstViewController,
                           secondViewController]
    }
}
