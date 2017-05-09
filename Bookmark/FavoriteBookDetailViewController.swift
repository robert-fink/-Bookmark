//
//  FavoriteBookDetailViewController.swift
//  Bookmark
//
//  Created by Leo Kim on 5/9/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class FavoriteBookDetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var favoriteBook : FavoriteBook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = favoriteBook?.title
        authorLabel.text = favoriteBook?.author
        descriptionLabel.text = favoriteBook?.bookDescription
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
