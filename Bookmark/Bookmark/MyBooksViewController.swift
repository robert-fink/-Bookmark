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
        guard segue.identifier == "showFavoriteBookSegue" else { return }
        if let destination = segue.destination as? MyFavoriteBooksDetailViewController,
            let indexPath = collectionViewOutlet.indexPathsForSelectedItems,
            let row = collectionViewOutlet.indexPathsForSelectedItems{
            print(indexPath)
//            collectionViewOutlet.deselectRow(at: indexPath, animated: true)
//            destination.category = categories[row]
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
