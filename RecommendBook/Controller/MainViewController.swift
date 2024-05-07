//
//  MainViewController.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

class MainViewController : UIViewController{
    
    
    private let mainView = MainView()
    let API = APIDataManager()
    let CDM = CoreDataManager()
    var searchItem = [Book]()
    var recentItem = [Book]()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.SearchBar.delegate = self
        navigationController?.isNavigationBarHidden = true
                mainView.tableView.dataSource = self
                mainView.tableView.delegate = self
        mainView.tableView.register(WishCell.self, forCellReuseIdentifier: WishCell.identifier)
        mainView.tableView.register(RecentCell.self, forCellReuseIdentifier: RecentCell.identifier)
        self.view.backgroundColor = UIColor.white
    }
}
extension MainViewController : UISearchBarDelegate {
    private func dismissKeyBoard() {
        mainView.SearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyBoard()
        
        guard let search = searchBar.text, search.isEmpty == false else { return }
        API.readAPI(search){ [weak self] search in
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

extension MainViewController : UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if recentItem.isEmpty == true {
            return 1
        }else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if recentItem.isEmpty == true {
            return "검색 결과"
        }else {
            if section == 0 {
                return "최근 본 책"
            }else {
                return "검색 결과"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
            header.textLabel?.textColor = UIColor.black
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            header.textLabel?.frame = header.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recentItem.isEmpty == true {
            return searchItem.count
        }else {
            if section == 0 {
                return 1
            }else {
                return searchItem.count
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if recentItem.isEmpty == true {
            return 40
        }else {
            if indexPath.section == 0 {
                return 150
            }else {
                return 40
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if recentItem.isEmpty == true {
            guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: WishCell.identifier, for: indexPath) as? WishCell else {return UITableViewCell() }
            cell.titleLbl.text = searchItem[indexPath.row].title
            for i in searchItem[indexPath.row].authors {
                cell.authorLbl.text = (cell.authorLbl.text ?? "") + i + ","
            }
            cell.priceLbl.text = String(searchItem[indexPath.row].price) + "원"
            return cell
        }else {
            if indexPath.section == 0 {
                guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: RecentCell.identifier, for: indexPath) as? RecentCell else {return UITableViewCell() }
                cell.recentList = recentItem
                DispatchQueue.main.async {
                    cell.collection.reloadData()
                }
                cell.detail = self
                return cell
            }else {
                guard let cell = mainView.tableView.dequeueReusableCell(withIdentifier: WishCell.identifier, for: indexPath) as? WishCell else {return UITableViewCell() }
                cell.titleLbl.text = searchItem[indexPath.row].title
                for i in searchItem[indexPath.row].authors {
                    cell.authorLbl.text = (cell.authorLbl.text ?? "") + i + ","
                }
                cell.priceLbl.text = String(searchItem[indexPath.row].price) + "원"
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        if recentItem.count == 10 {
            recentItem.removeLast()
        }
        recentItem.insert(searchItem[indexPath.row], at: 0)
        detailVC.current = searchItem[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        detailVC.alertDelegate = self
        present(detailVC, animated: true)
        mainView.tableView.reloadData()
    }
    
    
}

extension MainViewController : alertPresent {
    func alertP(_ title: Book) {
        let alert = UIAlertController(title: "담던가 말던가", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ (action) in
            var name : String = ""
            if title.authors.isEmpty == false {
                name = title.authors[0]
            }
            self.CDM.savetitle(userData: Wish(authors: name, title: title.title, price: title.price))
            }
        let cancelAction = UIAlertAction(title: "cancel", style: .default){ (action) in
            }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

extension MainViewController : selectCell {
    func detailP(_ title: Book) {
        let detailVC = DetailVC()
        if recentItem.count == 10 {
            recentItem.removeLast()
        }
        recentItem.insert(title, at: 0)
        detailVC.current = title
        detailVC.alertDelegate = self
        present(detailVC, animated: true)
        mainView.tableView.reloadData()
    }
}
