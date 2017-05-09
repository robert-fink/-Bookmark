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
    
    @IBOutlet weak var collectionViewOutlet: MyBooksCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getFavoriteBooks()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
        //return trip.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mybookscell", for: indexPath)
        
        if let cell = cell as? MyBooksCollectionViewCell {
            cell.bookImage.image = #imageLiteral(resourceName: "Books")
//            cell.bookTitle.text = favoriteBooksCollection[indexPath.row].title
        }
        
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mybooksdetailsegue" {
            let destination = segue.destination as! FavoriteBookDetailViewController
            //let indexPath = sender as! NSIndexPath
            //let selectedRow = favoriteBooksCollection[indexPath.row]
            //destination.authorLabel.text = selectedRow.author
            //destination.descriptionTextView.text = selectedRow.bookDescription
            //destination.titleLabel.text = selectedRow.title
            destination.authorSegue = "TestAuthor"
            destination.descriptionSegue = "Lorem ipsum blah"
            destination.titleSegue = "Book TM"
            destination.title? = "Testing Book Title up here"
        }
    }
    
    // Set the indexPath of the selected item as the sender for the segue
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "mybooksdetailsegue", sender: indexPath)
//    }
    
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
