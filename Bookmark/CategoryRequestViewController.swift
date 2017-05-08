//
//  CategoryRequestViewController.swift
//  Bookmark
//
//  Created by Admin on 5/7/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class CategoryRequestViewController: UIViewController {
    
    var category: FavoriteCategory?

    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCategory()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getCategory() {
        if let category = category {
            if let name = category.name {
                categoryLabel.text = name
                print("Category: " + name)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
