//
//  NYTBookFavoriteCV.swift
//  Bookmark
//
//  Created by Mike Witter on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class NYTBookFavoriteCV: UICollectionViewCell {
    
    @IBOutlet weak var favBookImage: UIImageView!
    @IBOutlet weak var favBookLabel: UILabel!
    
    var nytBestSellerModel: NYTBestSellerModel!
    
    func configureCellForBookObj(nytBestSellerBookModel: NYTBestSellerModel) {
        
        self.nytBestSellerModel = nytBestSellerBookModel
        
        // Set the bookname based off the data received from the NYTBestSellerModel
        favBookLabel.text = self.nytBestSellerModel.bookListName
        
        // Image is a url need to conver to UIImage
        let imageUrlString = self.nytBestSellerModel.bookImage
        
        // Convert to URL
        let imageUrl = URL(string: imageUrlString)
        
        // Get the Data from the ImageURL
        let imageData = try! Data(contentsOf: imageUrl!)
        
        // Create a image from the imageData
        let image = UIImage(data: imageData)
        
        // Display the image in the UImageView
        favBookImage.image = image
    }
}
