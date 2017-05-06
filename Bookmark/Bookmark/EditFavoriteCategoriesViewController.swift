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
     var categories: [String] = ["Advice How-To and Miscellaneous","Chapter Books","Childrens Middle Grade","Picture Books","Series Books","Young Adult","Young Adult Paperback","Hardcover Graphic Books","Paperback Graphic Books","Manga","Animals","Business Books","Celebrities","Crime and Punishment","Culture","Education","Espionage","Expeditions Disasters and Adventures","Fashion Manners and Customs","Food and Fitness","Games and Activities","Hardcover Business Books","Health","Humor","Indigenous Americans","Relationships","Paperback Business Books","Family","Hardcover Political Books","Race and Civil Rights","Religion Spirituality and Faith","Science","Sports","Travel"]
    
    var favoriteCategories: [String] = []
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var categoryTableView: UITableView!
//    @IBOutlet weak var editButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCategories(_ sender: Any) {
        if (categoryTableView.isEditing) {
            categoryTableView.isEditing = false
//            addButton.
//            editButton.setTitle("Edit your favorite categories", for: .normal)
        } else {
            categoryTableView.isEditing = true
//            editButton.setTitle("Done", for: .normal)
        }
    }
    
//    @IBAction func editCategories(_ sender: UIButton) {
//        if (categoryTableView.isEditing) {
//            categoryTableView.isEditing = false
//            editButton.setTitle("Edit your favorite categories", for: .normal)
//        } else {
//            categoryTableView.isEditing = true
//            editButton.setTitle("Done", for: .normal)
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
     // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
     }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .insert
    }
    
     // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
            favoriteCategories.append(categories[indexPath.row])
            print(favoriteCategories)
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let category = FavoriteCategory(context: context)
                category.name = categories[indexPath.row]
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                categories.remove(at: indexPath.row)
                tableView.reloadData()
            }
         }
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
