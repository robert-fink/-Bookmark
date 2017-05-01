//
//  BrowseBookVC.swift
//  Bookmark
//
//  Created by Tom Marler on 4/29/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class BrowseBookVC: UIViewController {
    

//    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
//    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
//
//    
//    var NYTBookObj = [Book]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("This is the BrowseBookVC")
//        getNYTBestSellingBooks()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.items.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        
//        // get a reference to our storyboard cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! NYTBestSellerCV
//        
//        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
//        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle tap events
//        print("You selected cell #\(indexPath.item)!")
//    }
    
    
//    func getNYTBestSellingBooks() {
//        
//        // Session Configuration
//        let config = URLSessionConfiguration.default
//        
//        // Load configuration into session
//        let session = URLSession(configuration: config)
//        
//        
//        let url = URL(string: NYT_BEST_SELLER)!
//        
//        let task = session.dataTask(with: url, completionHandler: {
//            (data, response, error) in
//            
//            if error != nil {
//                
//                print(error!.localizedDescription)
//                
//            } else {
//                
//                do {
//                    
//                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
//                    {
//                        if let results = json["results"] as? Dictionary<String, AnyObject> {
//                            if let lists = results["lists"] as? [Dictionary<String, AnyObject>] {
//                                for listObject in lists {
//                                    for element in (listObject["books"] as? [Dictionary<String, AnyObject>])! {
//                                        
//                                        let bestSellerBook = NYTBestSellerModel(bookDict: element, listDict: listObject)
//                                        self.
//                                    }
//                                }
//                            }
//                        }
//                    }
//                    
//                } catch {
//                    
//                    print("error in JSONSerialization")
//                }
//            }
//        })
//        task.resume()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
