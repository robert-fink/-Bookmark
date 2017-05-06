//
//  ProfileViewController.swift
//  Bookmark
//
//  Created by Robert Fink on 4/26/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var profile: [Profile] = []
    var favoriteCategories = [FavoriteCategory]()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fictionLabel: UILabel!
    @IBOutlet weak var nonFictionLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
        getFavoriteCategories()
        
        // TODO: NEED TO SORT BY ABC
        loadCategory()
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCategoryCell", for: indexPath)

        // Sort the global array favorities categories
        let sortFavorites = favoriteCategories.sorted(by: {$0.name! < $1.name!} )
        cell.textLabel?.text = sortFavorites[indexPath.row].name
        return cell
    }
    
    func getProfileData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            do {
                profile = try context.fetch(Profile.fetchRequest())
            } catch {
                print("Profile core data fetch request failed.\n")
            }
            
            if let profile = profile.last {
                if let name = profile.name {
                    nameLabel.text = name + ", " + "\(profile.age)"
                }
                if profile.is_fiction {
                    fictionLabel.text = "Fiction: On"
                    print("Profile fiction on. \n ")
                } else {
                    print("Profile fiction off. \n ")
                    fictionLabel.text = "Fiction: Off"
                }
                if profile.is_non_fiction {
                    print("Profile non-fiction on. \n ")
                    nonFictionLabel.text = "Non-fiction: On"
                } else {
                    print("Profile non-fiction off. \n ")
                    nonFictionLabel.text = "Non-fiction: Off"
                }
            }
        }
    }
    
    func getFavoriteCategories() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            do {
                
                favoriteCategories = try context.fetch(FavoriteCategory.fetchRequest())
                
            } catch {
                print("Favorite categories core data fetch request failed.\n")
            }
        }
    }
    
    // TODO: NEED TO REMOVE DUPLICATES
    func loadCategory() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            
            // Get the resource URL for the JSON file
            let url = Bundle.main.url(forResource: "category", withExtension: "json")
            
            // Get the data from the URL path
            let data = try? Data(contentsOf: url!)
            
            do {
                
                //let book = bookType?.caseInsensitiveCompare(
                
                // Get JSON root as Dictionary
                let jsonRoot = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                // From jsonRoot get the results dictionary
                let results = jsonRoot?["results"] as? [Dictionary<String, AnyObject>]
                
                // Loop through the JSON results node
                for resultObject in results! {
                    
                    let bookCategory = FavoriteCategory(context: context)
                    bookCategory.name = resultObject["list_name"] as? String
                    
                    // If the global favoriteCategories array does not contain the new value
                    if !favoriteCategories.contains(bookCategory) {
                        
                        // Add it to the global array
                        favoriteCategories.append(bookCategory)
                    } else {
                        print("\(bookCategory) is already in list")
                    }
                }
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            }
        }
    }
    
    
}
