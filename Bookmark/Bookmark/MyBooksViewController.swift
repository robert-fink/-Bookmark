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
            let book = favoriteBooksCollection[indexPath.row]
            cell.configureCellForBookObj(favoriteBook: book)
            
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
                    destination.authorSegue = favoriteBooksCollection[indexPath.row].author!
                    destination.descriptionSegue = favoriteBooksCollection[indexPath.row].bookDescription!
                    destination.titleSegue = favoriteBooksCollection[indexPath.row].title!
                    destination.imageSegue = cell.bookImage.image!
                    destination.isbn13 = favoriteBooksCollection[indexPath.row].isbn13!
                    
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
