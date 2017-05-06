//
//  NYTCategory.swift
//  Bookmark
//
//  Created by Tom Marler on 5/6/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation

class NYTCategory {
    
    var _bookListName: String!
    
    var bookListName: String {
        if _bookListName == nil {
            _bookListName = ""
        }
        
        return _bookListName
        
    }
    init(){}
    
    init(ListName: Dictionary<String, AnyObject>) {
        if let bookListName = ListName["list_name"] as? String {
            self._bookListName = bookListName
        }
    }
    
    func loadCategoryJSON(fileName: String) -> [NYTCategory] {
        var category = [NYTCategory]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            category = parseJSON(data)
        }
        return category
    }
    
    func parseJSON(_ data: Data) -> [NYTCategory] {
        
        var category = [NYTCategory]()
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            let root = json as? Dictionary<String, AnyObject>
            let results = root?["results"] as? [Dictionary<String, AnyObject>]
            for obj in results! {
                let categoryModel = NYTCategory(ListName: obj)
                category.append(categoryModel)
            }
            
        }
        return category
    }
}
