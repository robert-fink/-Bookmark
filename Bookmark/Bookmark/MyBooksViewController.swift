//
//  MyBooksViewController.swift
//  Bookmark
//
//  Created by Dale Brauer on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class MyBooksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var favoriteBooksCollection : [FavoriteBook] = []
    var bookImage: UIImage? = nil
    
    @IBOutlet weak var collectionViewOutlet: MyBooksCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFavoriteBooks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getFavoriteBooks()
        collectionViewOutlet.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBookCover(isbn: String) -> UIImage? {
        var imageToReturn: UIImage? = nil
            let imageUrlString = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)")
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
                                        
                                        DispatchQueue.main.sync(execute:  {
                                            imageToReturn = image
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
        return imageToReturn
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteBooksCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mybookscell", for: indexPath)
//        
//        if let cell = cell as? MyBooksCollectionViewCell {
//            cell.bookImage.image = #imageLiteral(resourceName: "Books")
//            //cell.bookImage.image = getBookCover(isbn: favoriteBooksCollection[indexPath.row].isbn13!)
//            cell.bookTitle.text = favoriteBooksCollection[indexPath.row].title
//        }
//        
//        return cell
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mybookscell", for: indexPath as IndexPath) as? MyBooksCollectionViewCell {
            let bookmodelCell = favoriteBooksCollection[indexPath.row]
            cell.configureCellForBookObj(favoriteBook: bookmodelCell)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mybooksdetailsegue" {
            if let cell = sender as? MyBooksCollectionViewCell, let indexPath = collectionViewOutlet.indexPath(for: cell) {
                if let destination = segue.destination as? FavoriteBookDetailViewController {
                    print("\(indexPath.row)")
                    //destination.authorLabel.text = selectedRow.author
                    //destination.descriptionTextView.text = selectedRow.bookDescription
                    //destination.titleLabel.text = selectedRow.title
                    destination.authorSegue = "TestAuthor"
                    destination.descriptionSegue = "Lorem ipsum blah"
                    destination.titleSegue = "Book TM"
                    destination.title? = "Testing Book Title up here"
                    //destination.favoriteBook = selectedItem
                }
            }
        }
    }
    
    func getFavoriteBooks(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            do {
                favoriteBooksCollection = try context.fetch(FavoriteBook.fetchRequest())
            } catch {
                print("Favorite categories core data fetch request failed.\n")
            }
        }
    }
}
