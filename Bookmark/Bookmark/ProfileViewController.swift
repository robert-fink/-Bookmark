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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
        getFavoriteCategories()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getProfileData()
        getFavoriteCategories()
        categoryTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCategoryCell", for: indexPath)
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
}
