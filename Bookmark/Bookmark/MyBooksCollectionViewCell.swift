//
//  MyBooksCollectionViewCell.swift
//  Bookmark
//
//  Created by Dale Brauer on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class MyBooksCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    
    var favoriteBook: FavoriteBook!
//    
//    var nytBestSeller = NYTBestSellerModel()
//    var books = [NYTBestSellerModel]()
//    var bookmodelCell: NYTBestSellerModel!
//    var bookmodel: NYTBestSellerModel!
//    
    func configureCellForBookObj(favoriteBook: FavoriteBook) {
        
        self.favoriteBook = favoriteBook
        
        // Set the bookname based off the data received from the NYTBestSellerModel
        bookTitle.text = self.favoriteBook.title
        
        print(favoriteBook.isbn13!)
        
        // Convert to URL
        let urlString = "http://covers.openlibrary.org/b/isbn/" + favoriteBook.isbn13! + "-M.jpg"
        let imageUrl = URL(string: urlString)
        
        print(imageUrl!)
        
        print(favoriteBook)
        
        // Get the Data from the ImageURL
        let imageData = try! Data(contentsOf: imageUrl!)
        
        // Create a image from the imageData
        let image = UIImage(data: imageData)
        
        // Display the image in the UImageView
        bookImage.image = image
    }
    
}
