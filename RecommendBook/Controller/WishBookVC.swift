//
//  WishBookVC.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/6/24.
//

import UIKit

class WishBookVC : UIViewController {
    private let wishBook = WishBook()
    private let CDM = CoreDataManager()
    
    override func loadView() {
        view = wishBook
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wishBook.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        wishBook.tableView.dataSource = self
        wishBook.tableView.delegate = self
        wishBook.tableView.register(WishCell.self, forCellReuseIdentifier: WishCell.identifier)
        
        navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        addButtonAction()
    }
    
    private func addButtonAction() {
        wishBook.deleteBtn.addTarget(self, action: #selector(delAction), for: .touchUpInside)
        wishBook.addBtn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }
    
    @objc func delAction() {
        CDM.deletetitle(num: 0, all: true)
        wishBook.tableView.reloadData()
    }
    
    @objc func addAction() {
        self.tabBarController?.selectedIndex = 0
    }
}

extension WishBookVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CDM.readtitle().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = wishBook.tableView.dequeueReusableCell(withIdentifier: WishCell.identifier, for: indexPath) as? WishCell else { return UITableViewCell() }
        
        cell.titleLbl.text = CDM.readtitle()[indexPath.row].title
        cell.authorLbl.text = CDM.readtitle()[indexPath.row].authors
        cell.priceLbl.text = String(CDM.readtitle()[indexPath.row].price) + "원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) { if editingStyle == .delete {
            CDM.deletetitle(num: indexPath.row, all: false)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


