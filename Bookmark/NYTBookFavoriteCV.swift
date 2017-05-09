//
//  NYTBookFavoriteCV.swift
//  Bookmark
//
//  Created by Mike Witter on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class NYTBookFavoriteCV: UICollectionViewCell {
    
    @IBOutlet weak var favBookLabel: UILabel!
    @IBOutlet weak var favBookImage: UIImageView!
//    @IBOutlet weak var favBookImage: UIImageView!
//    @IBOutlet weak var favBookLabel: UILabel!
    
    var nytfavCategory: NYT_FavoriteCateogryBookModel!
    
    func configureCellForBookObj(nytfavCategory: NYT_FavoriteCateogryBookModel) {
        
        self.nytfavCategory = nytfavCategory
        
        // Set the bookname based off the data received from the NYTBestSellerModel
        favBookLabel.text = self.nytfavCategory.bookAuthor
        
        let isbn = self.nytfavCategory.bookISBN13
        let isbnImageURL = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(nytfavCategory.bookISBN13)"
//        let isbnImageURL = "https://covers.openlibrary.org/b/isbn/\(isbn)-S.jpg"
        print(isbnImageURL)
        
//        // Convert to URL
        let imageUrl = URL(string: isbnImageURL)
//
//        // Get the Data from the ImageURL
        let imageData = try! Data(contentsOf: imageUrl!)
//
//        // Create a image from the imageData
        let image = UIImage(data: imageData)
//
//        // Display the image in the UImageView
        if image == nil {
            let imageUrl = URL(string: "https://lorempixel.com/50/50/sports/1/")
            let imageData = try! Data(contentsOf: imageUrl!)
            let image = UIImage(data: imageData)
            favBookImage.image = image
        }
    }
}
