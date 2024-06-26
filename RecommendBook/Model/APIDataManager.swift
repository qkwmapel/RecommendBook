//
//  APIDataManager.swift
//  RecommendBook
//
//  Created by 송정훈 on 5/2/24.
//

import Foundation

// Use Plist for get API_KEY
private var apiKey: String {
    get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
            fatalError("Couldn't find file 'Info.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "RestAPIKEY") as? String else {
            fatalError("Couldn't find key 'RestAPIKey' in 'Info.plist'.")
        }
        return value
    }
}

class APIDataManager {
    
    func readAPI(_ title : String,page : String,completion: @escaping (Result<BookData,Error>)->Void) {
        if let url = URL(string: "https://dapi.kakao.com/v3/search/book?target=title") {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [URLQueryItem(name: "query", value: title),URLQueryItem(name: "page", value: page)]
            
            components.queryItems = components.queryItems.map{ $0 + queryItems} ?? queryItems
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = ["Authorization": "KakaoAK \(apiKey)"
            ]
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                if let error = error {
                    print(error)
                }else if let data = data {
                    do {
                        let book = try JSONDecoder().decode(BookData.self, from: data)
                        completion(.success(book))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func readImage(_ image: String, completion: @escaping (Result<Data,Error>)->Void) {
        if let url = URL(string: image) {
            let task = URLSession.shared.dataTask(with: url) {
                data, response, error in
                if let error = error {
                    completion(.failure(error))
                }else if let data = data {
                    completion(.success(data))
                }
            }
            task.resume()
        }
    }
    
}
