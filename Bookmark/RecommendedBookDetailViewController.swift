//
//  RecommendedBookDetailViewController.swift
//  Bookmark
//
//  Created by Admin on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class RecommendedBookDetailViewController: UIViewController {
    
    var book: NYT_FavoriteCateogryBookModel?

    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayBook()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayBook() {
        if let book = book {
            bookTitle.text = book.bookTitle
            
            let imageUrlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(book.bookISBN13)"
            
            // Convert to URL
            let imageUrl = URL(string: imageUrlString)
            
            // Get the Data from the ImageURL
            let imageData = try! Data(contentsOf: imageUrl!)
            
            // Create a image from the imageData
            let image = UIImage(data: imageData)
            
            // Display the image in the UImageView
            imageView.image = image
            
            author.text = book.bookAuthor
            
//            bookDescription.text = book.description
        }
        
    }
    
    

}
