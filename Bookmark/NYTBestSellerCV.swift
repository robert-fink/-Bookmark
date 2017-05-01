//
//  NYTBestSellerCV.swift
//  Bookmark
//
//  Created by Tom Marler on 4/30/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class NYTBestSellerCV: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    var nytBestSellerBookModel: NYTBestSellerModel!

    
    func configureCellForBookObj(nytBestSellerBookModel: NYTBestSellerModel) {
        print("We are getting somewhere")
        self.nytBestSellerBookModel = nytBestSellerBookModel
        myLabel.text = self.nytBestSellerBookModel.bookListName
//        self.bookmodel = bookmodel
//        titleLabel.text = self.bookmodel.bookAuthor
//        thumbImg.image = UIImage(named: "\(self.bookmodel.bookImage)")
    }
}
