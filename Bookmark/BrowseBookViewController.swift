//
//  BrowseBookViewController.swift
//  Bookmark
//
//  Created by Admin on 5/7/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class BrowseBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var browseTableView: UITableView!
    
    var categories: [FavoriteCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getCategories()
        browseTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    func getCategories() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            do {
                categories = try context.fetch(FavoriteCategory.fetchRequest())
            } catch {
                print("Favorite categories core data fetch request failed.\n")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRecommendedBooksSegue", sender: self)
    }

    
    // MARK: - Prepare Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showRecommendedBooksSegue" else { return }
        if let destination = segue.destination as? CategoryRequestViewController,
            let indexPath = browseTableView.indexPathForSelectedRow,
            let row = browseTableView.indexPathForSelectedRow?.row {
                browseTableView.deselectRow(at: indexPath, animated: true)
                destination.category = categories[row]
        }
    }
 

}
