//
//  NYT_FavoriteCateogryBookModel.swift
//  Bookmark
//
//  Created by Tom Marler on 5/8/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation

class NYT_FavoriteCateogryBookModel {
    
    var _bookTitle: String!
    var _bookAuthor: String!
    var _bookISBN10: String!
    var _bookISBN13: String!
    var _bookImage: String!
    var _bookListName: String!
    
    var bookISBN10: String {
        if _bookISBN10 == nil {
            _bookISBN10 = ""
        }
        
        return _bookISBN10
    }
    
    var bookISBN13: String {
        if _bookISBN13 == nil {
            _bookISBN13 = ""
        }
        
        return _bookISBN13
    }
    
    var bookTitle: String {
        if _bookTitle == nil {
            _bookTitle = ""
        }
        
        return _bookTitle
    }
    
    var bookAuthor: String {
        if _bookAuthor == nil {
            _bookAuthor = ""
        }
        
        return _bookAuthor
    }
    
    var bookListName: String {
        if _bookListName == nil {
            _bookListName = ""
        }
        
        return _bookListName
    }
    
    init(){}
    
    init(Lists: Dictionary<String, AnyObject>, BookDetails: Dictionary<String, AnyObject>) {
        if let bookTitle = BookDetails["title"] as? String{
            self._bookTitle = bookTitle
        }
        if let bookISBN10 = BookDetails["primary_isbn10"] as? String{
            self._bookISBN10 = bookISBN10
        }
        if let bookISBN13 = BookDetails["primary_isbn13"] as? String{
            self._bookISBN13 = bookISBN13
        }
        if let bookAuthor = BookDetails["author"] as? String{
            self._bookAuthor = bookAuthor
        }
        if let bookListName = Lists["list_name"] as? String {
            self._bookListName = bookListName
        }
//        if let bookImage = bookDict["book_image"] as? String{
//            self._bookImage = bookImage
//        }
    }
//    func loadJSONFavorite(userFavoriteCategory: String) {
////        var books = [NYTBestSellerModel]()
////        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
////            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
////            books = parseJSON(data)
////        }
////        return books
//        var favoriteBooks = [NYT_FavoriteCateogryBookModel]()
//        //var categoryURL = NYTUrl.doSth(userFavoriteCategory)
//        print("This is the url from loadJSON\(userFavoriteCategory)")
//        //return userFavoriteCategory
//    }
//    func parseJSON(_ data: Data) -> [NYTBestSellerModel] {
//        
//        var books = [NYTBestSellerModel]()
//        
//        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
//            let root = json as? Dictionary<String, AnyObject>
//            let results = root?["results"] as? Dictionary<String, AnyObject>
//            let lists = results?["lists"] as? [Dictionary<String, AnyObject>]
//            for resultsObject in lists! {
//                for element in (resultsObject["books"] as? [Dictionary<String, AnyObject>])! {
//                    let bookModel = NYTBestSellerModel(bookDict: element, listDict: resultsObject)
//                    books.append(bookModel)
//                }
//            }
//        }
//        return books
//    }
}
