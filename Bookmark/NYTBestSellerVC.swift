
//
//  BestSellerBookVC.swift
//  Bookmark
//
//  Created by Tom Marler on 4/29/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit


class BestSellerBookVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var books = [NYTBestSellerModel]()
    var bookmodelCell: NYTBestSellerModel!
    var bookmodel: NYTBestSellerModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        books = loadJSON(fileName: "NYTimeBestSeller")
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
            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

            return cell
        } else {
            
            return UICollectionViewCell()
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        // TODO: Send over through segue
        print("You selected cell #\(indexPath.item)!")
    }
    
    func loadJSON(fileName: String) -> [NYTBestSellerModel] {
        var books = [NYTBestSellerModel]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            books = parseJSON(data)
        }
        return books
    }
    
    func parseJSON(_ data: Data) -> [NYTBestSellerModel] {
        
        var books = [NYTBestSellerModel]()
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            let root = json as? Dictionary<String, AnyObject>
            let results = root?["results"] as? Dictionary<String, AnyObject>
            let lists = results?["lists"] as? [Dictionary<String, AnyObject>]
            for resultsObject in lists! {
                for element in (resultsObject["books"] as? [Dictionary<String, AnyObject>])! {
                    let bookModel = NYTBestSellerModel(bookDict: element, listDict: resultsObject)
                    books.append(bookModel)
                }
            }
        }
        return books
    }
}
