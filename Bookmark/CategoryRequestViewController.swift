//
//  CategoryRequestViewController.swift
//  Bookmark
//
//  Created by Admin on 5/7/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class CategoryRequestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleCategory: UILabel!
    var category: FavoriteCategory?
    var favoriteCategory = NYT_FavoriteCateogryBookModel()
    var favoriteBooks = [NYT_FavoriteCateogryBookModel]()
    var favoriteBookCell: NYT_FavoriteCateogryBookModel!
    var favoriteBookModel: NYT_FavoriteCateogryBookModel!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseFavoriteCategoryJSON()
        titleCategory.text = category?.name
        print(category?.name!)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("This is the collection view\(self.favoriteBooks.count)")
        return self.favoriteBooks.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? NYTBookFavoriteCV {
            let favoriteBookCell = favoriteBooks[indexPath.row]
            cell.configureCellForBookObj(nytfavCategory: favoriteBookCell)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func parseFavoriteCategoryJSON() {
        
        _ = URLSession.shared
        let categoryName = category?.name as! String
        //let urlString = URL(string: NYT_FAV_BOOK_CATEGORY)
        var components = URLComponents()
        let url = "https://api.nytimes.com/svc/books/v3/lists//.json?list-name=\(categoryName)&api-key=c0eb75956bc54185ab23677cd6dd4970"
        let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //let urlString = NYTUrl.sharedInstance.buildCateogryURL(category: categoryName)
        let urlString = URL(string: encoded!)
        //print(urlString)
        //let request = URL(string: urlString)
        //print(request)
        let task = URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            
            if error != nil {
                print(error!)
            } else {
                
                if let urlContent = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, AnyObject> {
                            let root =  json
                            if let results = root["results"] as? [Dictionary<String, AnyObject>] {
                                for obj in results {
                                    for element in (obj["book_details"] as? [Dictionary<String, AnyObject>])!{
                                        //print("Element: \(element)")
                                        let bookModel = NYT_FavoriteCateogryBookModel(Lists: obj, BookDetails: element)
                                        self.favoriteBooks.append(bookModel)
                                        
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

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("checkpoint 1")
        if segue.identifier == "recommendedBookDetailSegue" {
            print("checkpoint 2")
            if let cell = sender as? NYTBookFavoriteCV, let indexPath = collectionView.indexPath(for: cell) {
                print("checkpoint 3")
                if let destination = segue.destination as? RecommendedBookDetailViewController {
                    print("checkpoint 4")
                    print("\(indexPath.row)")
                    destination.book = favoriteBooks[indexPath.row]
                }
            }
        }
    }
    

}
