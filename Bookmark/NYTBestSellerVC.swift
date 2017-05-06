
//
//  BestSellerBookVC.swift
//  Bookmark
//
//  Created by Tom Marler on 4/29/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit


class BestSellerBookVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var nytBestSeller = NYTBestSellerModel()
    var books = [NYTBestSellerModel]()
    var bookmodelCell: NYTBestSellerModel!
    var bookmodel: NYTBestSellerModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        books = nytBestSeller.loadJSON(fileName: "NYTimeBestSeller")
        for obj in books {
            print(obj.bookListName)
            print(obj.bookImage)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.books.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? NYTBestSellerCV {
            let bookmodelCell = books[indexPath.row]
            cell.configureCellForBookObj(nytBestSellerBookModel: bookmodelCell)
            //cell.backgroundColor = .clearColor
            // make cell more visible in our example project

            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        // TODO: Send over through segue
        var book: NYTBestSellerModel!
        book = books[indexPath.row]
        print("You selected cell #\(indexPath.item)!")
        //performSegue(withIdentifier: "NYTBookFavoriteVC", sender: book)
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "NYTBookFavoriteVC" {
//            if let detailsVC = segue.destination as? NYTBookFavoriteVC {
//                if let book = sender as? NYTBestSellerModel {
//                    detailsVC.nytBestSellerModel = book
//                    //detailsVC.pokemon = poke
//                }
//            }
//        }
//    }
}
