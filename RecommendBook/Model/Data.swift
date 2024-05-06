//
//  APIData.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import UIKit

struct BookData : Codable{
    let meta : Meta
    let documents : [Book]
    
    enum CodingKeys : String, CodingKey {
        case meta
        case documents
    }
}

struct Meta : Codable {
    let end : Bool
    let pagecnt : Int
    let totalcnt : Int
    
    enum CodingKeys : String, CodingKey {
        case end = "is_end"
        case pagecnt = "pageable_count"
        case totalcnt = "total_count"
    }
}

struct Book : Codable {
    let authors : [String]
    let contents : String
    let isbn : String
    let price : Int
    let thumbnail : String
    let title : String
}
struct Wish {
    let authors : String
    let title : String
    let price : Int
}
