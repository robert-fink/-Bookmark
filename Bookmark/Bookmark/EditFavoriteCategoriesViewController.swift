//
//  EditFavoriteCategoriesViewController.swift
//  Bookmark
//
//  Created by Admin on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class EditFavoriteCategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // removed Combined Print and E-Book Fiction","Combined Print and E-Book Nonfiction"
    var categories: [String] = ["Advice How-To and Miscellaneous","Chapter Books","Childrens Middle Grade","Picture Books","Series Books","Young Adult","Hardcover Graphic Books","Paperback Graphic Books","Manga","Animals","Business Books","Celebrities","Crime and Punishment","Culture","Education","Espionage","Expeditions Disasters and Adventures","Fashion Manners and Customs","Food and Fitness","Games and Activities","Hardcover Business Books","Health","Humor","Indigenous Americans","Relationships","Paperback Business Books","Family","Hardcover Political Books","Race and Civil Rights","Religion Spirituality and Faith","Science","Sports","Travel"]
    
    var favoriteCategories: [FavoriteCategory] = []
    
    var favoriteCategoriesAsStrings: [String] {
//        print("In favorite categories as strings")
        var tempArray: [String] = []
//        print(favoriteCategories)
        for favorite in favoriteCategories {
            if let name = favorite.name {
                tempArray.append(name)
            }
        }
//        print(tempArray)
        return tempArray
    }
    
//    var categoriesMinusFavorites: [String] {
//        var stringArray: [String] = []
//        let temp = removeDuplicateCategories(array1: favoriteCategoriesAsStrings, array2: categories)
//        print(temp)
//        print("In categories minus favorites")
//        for category in temp {
//            stringArray.append(category)
//        }
//        return stringArray
//    }
    
    var combinedCategories: [String] {
//        print("In combined categories")
//        return favoriteCategoriesAsStrings + categoriesMinusFavorites
        return favoriteCategoriesAsStrings + categories
    }
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var categoryTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getFavoriteCategories()
//        removeDuplicateCategories(array1: favoriteCategoriesAsStrings, array2: categories)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCategories(_ sender: UIBarButtonItem) {
        if (categoryTableView.isEditing) {
            categoryTableView.isEditing = false
            print(categories)
        } else {
            categoryTableView.isEditing = true
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String = ""
        if section == 0 {
            title =  "My Favorites"
        } else if section == 1 {
            title =  "All Other Categories"
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int = 0
        if section == 0 {
            count = favoriteCategories.count
        }
        if section == 1 {
//            count = categoriesMinusFavorites.count
            count = categories.count
//            print("count: " + "\(categoriesMinusFavorites.count)")
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
//        print("Combined category count: " + "\(combinedCategories.count)")
        print("Count: \(favoriteCategories.count)")
        print(favoriteCategories)
//        if favoriteCategoriesAsStrings.count < indexPath.row {
//            cell.textLabel?.text = favoriteCategoriesAsStrings[indexPath.row]
//        } else {
//            cell.textLabel?.text = categories[indexPath.row]
//        }
        cell.textLabel?.text = combinedCategories[indexPath.row]
        return cell
    }
    
     // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
     }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 0 {
            return .delete
        } else {
            return .insert
        }

    }
    
     // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            // Delete the row from the data source
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                categories.append(favoriteCategoriesAsStrings[indexPath.row])
                context.delete(favoriteCategories[indexPath.row])
                    
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()

                tableView.reloadData()
            }
//            categories.append(favoriteCategoriesAsStrings[indexPath.row])
            favoriteCategories.remove(at: indexPath.row)
            tableView.reloadData()
            
         } else if editingStyle == .insert {
            // Handle adding a favorite category
            if favoriteCategoriesAsStrings.contains(combinedCategories[indexPath.row]) {
                let alert = UIAlertController(title: "Oops", message: "This is already in your favorites.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    tableView.reloadData()
                }))
                
                present(alert, animated: true, completion: nil)
            } else {
                if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                    let category = FavoriteCategory(context: context)
                    var offsetIndex: Int {
                        return favoriteCategories.count + indexPath.row
                    }
                    category.name = combinedCategories[indexPath.row]
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    categories.remove(at: offsetIndex)
                    getFavoriteCategories()
                    tableView.reloadData()
                    
                }
            }
            
         }
     }
    
    func getFavoriteCategories() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            print("checkpoint")
            do {
                // TODO: I dont get this
                favoriteCategories = try context.fetch(FavoriteCategory.fetchRequest())
                
            } catch {
                print("Favorite categories core data fetch request failed.\n")
            }
        }
    }
    
    func removeDuplicateCategories(array1: [String], array2: [String]) -> Set<String> {
//        var noDuplicatesArray: [String] = []
        var noDuplicatesSet: Set<String> = []
        for a in array2 {
            noDuplicatesSet.insert(a)
        }
//        print(noDuplicatesSet)
//        for array in array2 {
//            print(array)
//            for ar1 in array1 {
//                if array.contains(ar1) {
//                    noDuplicatesSet.insert(array)
//                }
//            }
//        }
//        print(array2)
        return noDuplicatesSet
    }
    
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
