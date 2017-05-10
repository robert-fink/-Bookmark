//
//  NYTDetailViewController.swift
//  Bookmark
//
//  Created by Admin on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class NYTDetailViewController: UIViewController {
    
    var book: NYTBestSellerModel?
    
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
            author.text = book.bookAuthor
            bookDescription.text = book.bookDescription
            let imageUrlString = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(book.bookISBN13)")
            let task = URLSession.shared.dataTask(with: imageUrlString!) { (data, response, error) in
                
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
                                        
                                        DispatchQueue.main.async(execute:  {
                                            self.imageView.image = image
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

    
    @IBAction func saveBookAsFavorite(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let favBook = FavoriteBook(context: context)
            favBook.title = book?.bookTitle
            favBook.author = book?.bookAuthor
            favBook.isbn13 = book?.bookISBN13
            favBook.isbn10 = book?.bookISBN10
            favBook.bookDescription = book?.bookDescription
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            if let title = book?.bookTitle {
                let alert = UIAlertController(title: "Saved", message: "\(title) added to favorites.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                }))
                
                present(alert, animated: true, completion: nil)
            }
            
        }
    }



}
