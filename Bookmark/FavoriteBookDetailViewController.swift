//
//  FavoriteBookDetailViewController.swift
//  Bookmark
//
//  Created by Leo Kim on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class FavoriteBookDetailViewController: UIViewController {

    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var favoriteBook : FavoriteBook?
    var titleSegue = ""
    var authorSegue = ""
    var imageSegue = #imageLiteral(resourceName: "Books")
    var descriptionSegue = ""
    var amazonLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorLabel.text = authorSegue
        descriptionLabel.text = descriptionSegue
        titleLabel.text = titleSegue
        bookImage.image = imageSegue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
