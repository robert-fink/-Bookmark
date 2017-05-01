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
    }
}
