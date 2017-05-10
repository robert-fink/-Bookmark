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
    
    var nytfavCategory: NYT_FavoriteCateogryBookModel!
    
    func configureCellForBookObj(nytfavCategory: NYT_FavoriteCateogryBookModel) {
        
        self.nytfavCategory = nytfavCategory
        
        // Set the bookname based off the data received from the NYTBestSellerModel
        favBookLabel.text = self.nytfavCategory.bookTitle
        _ = URLSession.shared
        let isbn = self.nytfavCategory.bookISBN13
        let urlString = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)")
        
        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            
            if error != nil {
                print(error!)
            } else {
                
                if let urlContent = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, AnyObject> {
                            let root =  json
                            if let results = root["items"] as? [Dictionary<String, AnyObject>] {
                                for obj in results {
                                    let volumeInfo = obj["volumeInfo"] as! Dictionary<String, AnyObject>
                                    let imageLinks = volumeInfo["imageLinks"] as! Dictionary<String, AnyObject>
                                    let imageString = imageLinks["thumbnail"] as! String
                                    //        // Convert to URL
                                    let imageUrl = URL(string: imageString)
                                    //
                                    //        // Get the Data from the ImageURL
                                    // This returns url that is http
                                    let imageData = try! Data(contentsOf: imageUrl!)
                                    //
                                    //        // Create a image from the imageData
                                    let image = UIImage(data: imageData)
                                    //self.favBookImage.image = image
                                    
                                    DispatchQueue.main.sync(execute:  {
                                        self.favBookImage.image = image
                                    })
                                }
                            }
                            
                            
                            //print(json)
                        }
                        
                    } catch {
                        print("JSON Error")
                    }
                }
            }
        }
        task.resume()
        
    }
}
