
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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getDataWith {
            for obj in self.books {
                print("Book List Name: \(obj.bookListName)")
                print("Book Amazon Prime: \(obj.bookAmazonPrime)")
                print("Book Author: \(obj.bookAuthor)")
                print("Book Image: \(obj.bookImage)")
                print("Book Description: \(obj.bookDescription)")
                print("Book Price: \(obj.bookPrice)")
                print("Book Publisher: \(obj.bookPublisher)")
                print("Book Rank: \(obj.bookRank)")
                print("Book Rank Last Week: \(obj.bookRankLastWeek)")
                print("Book Week on List: \(obj.bookWeekOnList)")
                print("\n")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! NYTBestSellerCV
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func getDataWith(completion: @escaping DownloadComplete) {
        guard let url = URL(string: NYT_BEST_SELLER) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    DispatchQueue.main.async {
                        if let results = json["results"] as? Dictionary<String, AnyObject> {
                            if let lists = results["lists"] as? [Dictionary<String, AnyObject>] {
                                for listObject in lists {
                                    for element in (listObject["books"] as? [Dictionary<String, AnyObject>])! {
                                        let bestBook = NYTBestSellerModel(bookDict: element, listDict: listObject)
                                        self.books.append(bestBook)
                                    }
                                }
                            }
                        }
                        completion()
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
