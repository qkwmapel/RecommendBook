//
//  MainViewController.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

class MainViewController : UIViewController {
    private let mainView = MainView()
    let API = APIDataManager()
    var searchItem = [Book]()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.SearchBar.delegate = self
        navigationController?.isNavigationBarHidden = true
        //        mainView.collection.delegate = self
        //        mainView.collection.dataSource = self
                mainView.tableView.dataSource = self
                mainView.tableView.delegate = self
        mainView.tableView.register(WishCell.self, forCellReuseIdentifier: WishCell.identifier)
        self.view.backgroundColor = UIColor.white
    }
}
extension MainViewController : UISearchBarDelegate {
    private func dismissKeyBoard() {
        mainView.SearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyBoard()
        
        guard let search = searchBar.text else { return }
        
        API.readAPI(search){ [weak self]search in
            switch search {
            case .success(let books) :
                self?.searchItem = books
                print(self?.searchItem[0].authors ?? "")
                DispatchQueue.main.async {
                    self?.mainView.tableView.reloadData()
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //            self.isFiltering = false
        //            self.tableView.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.mainView.SearchBar.resignFirstResponder()
    }
    
}

//extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}

extension MainViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: WishCell.identifier, for: indexPath) as? WishCell else {return UITableViewCell() }
        cell.titleLbl.text = searchItem[indexPath.row].title
        for i in searchItem[indexPath.row].authors {
            cell.authorLbl.text = (cell.authorLbl.text ?? "") + i + ","
        }
        cell.priceLbl.text = String(searchItem[indexPath.row].price) + "원"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
