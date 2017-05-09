//
//  NYTUrl.swift
//  Bookmark
//
//  Created by Tom Marler on 4/30/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation

class NYTUrl {
    // Declare our 'sharedInstance' property
    static let sharedInstance = NYTUrl()
    
    // Set an initializer -
    // it will only be called once
    init() {
        print("SomeManager initialized")
    }
    
    // Add a test function
    func buildCateogryURL(category: String) -> String {

        
        let url = "https://api.nytimes.com/svc/books/v3/lists//.json?list-name=\(category)&api-key=c0eb75956bc54185ab23677cd6dd4970"
        //let url = "http://api.nytimes.com/svc/books/v3/lists/overview.json?list-name="Sports"&api-key=c0eb75956bc54185ab23677cd6dd4970"

        //rint("I'm doing something with\(urlString)")
        return url
    }
    
//    func getBookData() {
//        buildBookURL()
//        print("This is the from getbookData\(urlContent)")
//        
//    }
//    
//    func buildBookURL() {
//        
//        let NYT_BEST_SELLER = "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=c0eb75956bc54185ab23677cd6dd4970"
//        let urlPath = URL(string: NYT_BEST_SELLER)!
//        let urlRequest = URLRequest(url: urlPath)
//        
//        let task = URLSession.shared.dataTask(with: urlRequest) {
//            (data, response, error) in
//            if error != nil {
//                print(error!)
//            } else {
//                if let content = data {
//                    DispatchQueue.main.sync(execute: {
//                        self.urlContent = content
//                        //print(self.urlContent)
//                    })
////                    do {
////                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
////                        print(jsonResult)
////                    } catch {
////                        print("error")
////                    }
//                }
//            }
//        }
//        task.resume()
//        //return NYT_BEST_SELLER
//
//    }

    
}

// The 'init' function will
// only be called the first time


let apiKey = "c0eb75956bc54185ab23677cd6dd4970"
let paperBack = "Paperback Books"
let isbn = 9781423113461

let LIST_OVERVIEW = "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=c0eb75956bc54185ab23677cd6dd4970"

let NYT_BEST_SELLER = "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=c0eb75956bc54185ab23677cd6dd4970"
//let NYT_FAV_BOOK_CATEGORY = "https://api.nytimes.com/svc/books/v3/lists//.json?list-name=Combined Print & E-Book Fiction&api-key=c0eb75956bc54185ab23677cd6dd4970"
let NYT_FAV_BOOK_CATEGORY = "https://api.nytimes.com/svc/books/v3/lists//.json?list-name=Combined%20Print%20and%20E-Book%20Fiction&api-key=c0eb75956bc54185ab23677cd6dd4970"

typealias DownloadComplete = () -> ()
