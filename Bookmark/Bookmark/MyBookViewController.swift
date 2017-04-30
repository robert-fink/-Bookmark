//
//  MyBookViewController.swift
//  Bookmark
//
//  Created by Leo Kim on 4/29/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class MyBookViewController: UIViewController {

    //segmentController
    @IBOutlet weak var viewSegmentController: UISegmentedControl!
    
    //the Views
    @IBOutlet weak var listView: MyBookListView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }



}
