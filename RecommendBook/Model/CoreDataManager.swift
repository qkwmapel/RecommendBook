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
    
    func savetitle(userData: Wish) {
        guard let context = self.persistent?.viewContext else {return}
        let new = BookList(context: context)
        new.title = userData.title
        new.author = userData.authors
        new.price = Int32(userData.price)
        try? context.save()
    }
    
    func readtitle() -> [Wish] {
        var read : [Wish] = []
        guard let context = self.persistent?.viewContext else
        { return []}
        let request = BookList.fetchRequest()
        let loadData = try? context.fetch(request)
        for i in loadData! {
            read.append(Wish(authors: i.author!, title: i.title!, price: Int(i.price)))
        }
        return read
    }
    
    func deletetitle(num : Int, all : Bool) {
        guard let context = self.persistent?.viewContext else
        { return }
        let request = BookList.fetchRequest()
        guard let loadData = try? context.fetch(request) else {return}
        if all {
            let filtered = loadData
            for i in filtered {
                context.delete(i)
            }
        } else {
            let filtered = loadData[num]
            context.delete(filtered)
        }
        
        try? context.save()
      }
    
}
