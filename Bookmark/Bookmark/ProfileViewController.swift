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
    var favoriteCategories: [FavoriteCategory] = []
    //var nytcategory: NYTCategory!
//    var favoriteCategories = [NYTCategory]()
//    var nytCategory = NYTCategory()
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fictionLabel: UILabel!
    @IBOutlet weak var nonFictionLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
        // TODO: NEED TO SORT BY ABC
//        favoriteCategories = nytCategory.loadCategoryJSON(fileName: "category")
        //print(favoriteCategories)
        getFavoriteCategories()
        

        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // This return over 2,000 file should only be 53
        print("This is from number of rows in sections\(favoriteCategories.count)")
        return favoriteCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCategoryCell", for: indexPath)
        // Sort the global array favorities categories
//        let sortFavorites = favoriteCategories.sorted(by: {$0.bookListName < $1.bookListName } )
//        cell.textLabel?.text = sortFavorites[indexPath.row].bookListName
        cell.textLabel?.text = favoriteCategories[indexPath.row].name
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
                // TODO: I dont get this
//                favoriteCategories = try context.fetch(FavoriteCategory.fetchRequest()) as! [NYTCategory]
                favoriteCategories = try context.fetch(FavoriteCategory.fetchRequest())
                print("This is the getFavoriteCategories\(favoriteCategories.count)")
                
            } catch {
                print("Favorite categories core data fetch request failed.\n")
            }
        }
    }
}
