//
//  NYTBestSellerBook.swift
//  Bookmark
//
//  Created by Tom Marler on 4/30/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation

class NYTBestSellerModel {
    
    var _bookListName: String!
    var _bookAgeGroup: String!
    var _bookAmazonPrime: String!
    var _bookAuthor: String!
    var _bookImage: String!
    var _bookDescription: String!
    var _bookPrice: Double!
    var _bookPublisher: String!
    var _bookRank: Int!
    var _bookRankLastWeek: Int!
    var _bookWeekOnList: Int!
    var _bookTitle: String!
    var _bookISBN10: String!
    var _bookISBN13: String!
    typealias JSONStandard = Dictionary<String, AnyObject>
    
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

    var bookListName: String {
        if _bookListName == nil {
            _bookListName = ""
        }
        
        return _bookListName
    }
    var bookAgeGroup: String {
        if _bookAgeGroup == nil {
            _bookAgeGroup = ""
        }
        
        return _bookAgeGroup
    }
    var bookAmazonPrime: String {
        if _bookAmazonPrime == nil {
            _bookAmazonPrime = ""
        }
        
        return _bookAmazonPrime
    }
    var bookAuthor: String {
        if _bookAuthor == nil {
            _bookAuthor = ""
        }
        
        return _bookAuthor
    }
    var bookImage: String {
        if _bookImage == nil {
            _bookImage = ""
        }
        
        return _bookImage
    }
    var bookDescription: String {
        if _bookDescription == nil {
            _bookDescription = ""
        }
        
        return _bookDescription
    }
    var bookPrice: Double {
        if _bookPrice == nil {
            _bookPrice = 0.00
        }
        
        return _bookPrice
    }
    var bookPublisher: String {
        if _bookPublisher == nil {
            _bookPublisher = ""
        }
        
        return _bookPublisher
    }
    var bookRank: Int {
        if _bookRank == nil {
            _bookRank = 0
        }
        
        return _bookRank
    }
    var bookRankLastWeek: Int {
        if _bookRankLastWeek == nil {
            _bookRankLastWeek = 0
        }
        
        return _bookRankLastWeek
    }
    var bookWeekOnList: Int {
        if _bookWeekOnList == nil {
            _bookWeekOnList = 0
        }
        
        return _bookWeekOnList
    }
    
    init(){}
    
    
    init(bookDict: Dictionary<String, AnyObject>, listDict: Dictionary<String, AnyObject>) {
        
        if let bookListName = listDict["list_name"] as? String {
            self._bookListName = bookListName
        }
        
        if let bookAgeGroup = bookDict["age_group"] as? String{
            self._bookAgeGroup = bookAgeGroup
        }
        if let bookAmazonPrime = bookDict["amazon_product_url"] as? String{
            self._bookAmazonPrime = bookAmazonPrime
        }
        if let bookAuthor = bookDict["author"] as? String{
            self._bookAuthor = bookAuthor
        }
        if let bookImage = bookDict["book_image"] as? String{
            self._bookImage = bookImage
        }
        if let bookDescription = bookDict["description"] as? String{
            self._bookDescription = bookDescription
        }
        if let bookPrice = bookDict["price"] as? Double{
            self._bookPrice = bookPrice
        }
        if let bookPublisher = bookDict["publisher"] as? String{
            self._bookPublisher = bookPublisher
        }
        if let bookRankLastWeek = bookDict["rank_last_week"] as? Int{
            self._bookRankLastWeek = bookRankLastWeek
        }
        if let bookWeekOnList = bookDict["weeks_on_list"] as? Int{
            self._bookWeekOnList = bookWeekOnList
        }
        if let bookRank = bookDict["rank"] as? Int{
            self._bookRank = bookRank
        }
        if let bookTitle = bookDict["title"] as? String{
            self._bookTitle = bookTitle
        }
        if let bookISBN10 = bookDict["primary_isbn10"] as? String{
            self._bookISBN10 = bookISBN10
        }
        if let bookISBN13 = bookDict["primary_isbn13"] as? String{
            self._bookISBN13 = bookISBN13
        }
    }
    
//    func loadJSON(fileName: String) -> [NYTBestSellerModel] {
//        var books = [NYTBestSellerModel]()
//        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
//            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
//            books = parseJSON(data)
//        }
//        return books
//    }
//    
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
