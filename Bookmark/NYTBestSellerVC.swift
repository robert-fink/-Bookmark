
//
//  BestSellerBookVC.swift
//  Bookmark
//
//  Created by Tom Marler on 4/29/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit


class BestSellerBookVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var nytBestSeller = NYTBestSellerModel()
    var books = [NYTBestSellerModel]()
    var bookmodelCell: NYTBestSellerModel!
    var bookmodel: NYTBestSellerModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        parseBestSellerJSON()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("This is the collection view\(self.books.count)")
        return self.books.count
    }

    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? NYTBestSellerCV {
            let bookmodelCell = books[indexPath.row]
            cell.configureCellForBookObj(nytBestSellerBookModel: bookmodelCell)

            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("You selected cell #\(indexPath.item)!")
        //print(books[indexPath.item].bookListName)

    }
    
    func parseBestSellerJSON() {
        
        _ = URLSession.shared
        let request = URL(string: NYT_BEST_SELLER)
        let task = URLSession.shared.dataTask(with: request!) { (data, response, error) in
            
            if error != nil {
                print(error!)
            } else {
                
                if let urlContent = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, AnyObject> {
                            let root =  json
                            if let results = root["results"] as? Dictionary<String, AnyObject> {
                                if let lists = results["lists"] as? [Dictionary<String, AnyObject>] {
                                    for obj in lists {
                                        for element in (obj["books"] as? [Dictionary<String, AnyObject>])!{
                                            let bookModel = NYTBestSellerModel(bookDict: element, listDict: obj)
                                            self.books.append(bookModel)
                                        }
                                    }
                                }
                                
                            }
                            DispatchQueue.main.sync {
                                
                                self.myCollectionView.reloadData()
                                
                            }
                        }
                        
                        
                    } catch {
                        print("JSON error")
                    }
                }
            }
        }
        task.resume()
    }

}
