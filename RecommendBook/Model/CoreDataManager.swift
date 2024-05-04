//
//  CoreDataManager.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//
import Foundation
import UIKit
import CoreData

class CoreDataManager {
    var persistent : NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    func savetitle(userData: String) {
        guard let context = self.persistent?.viewContext else {return}
        let new = BookList(context: context)
        new.title = userData
        try? context.save()
    }
    
    func readUser() -> [String] {
        var read : [String] = []
        guard let context = self.persistent?.viewContext else
        { return []}
        let request = BookList.fetchRequest()
        let loadData = try? context.fetch(request)
        for i in loadData! {
            read.append(i.title!)
        }
        return read
    }
    
    //  func deleteUser(num : Int) {
    //    guard let context = self.persistent?.viewContext else
    //    { return }
    //    let request = User.fetchRequest()
    //    guard let loadData = try? context.fetch(request) else {return}
    //    let filtered = loadData[num]
    //    context.delete(filtered)
    //    try? context.save()
    //  }
    
}
