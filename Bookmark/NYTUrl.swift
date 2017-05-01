//
//  NYTUrl.swift
//  Bookmark
//
//  Created by Tom Marler on 4/30/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import Foundation

func getListData(ageGroup: String, price: Int, publisher: String){
    
    print(ageGroup, price, publisher)
}

let apiKey = "c0eb75956bc54185ab23677cd6dd4970"
let paperBack = "Paperback Books"
let isbn = 9781423113461

let LIST_OVERVIEW = "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=c0eb75956bc54185ab23677cd6dd4970"

let NYT_BEST_SELLER = "https://api.nytimes.com/svc/books/v3/lists/overview.json?published_date=2017-04-30&api-key=c0eb75956bc54185ab23677cd6dd4970"

typealias DownloadComplete = () -> ()
