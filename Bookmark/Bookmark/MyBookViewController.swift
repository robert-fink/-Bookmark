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
    @IBOutlet weak var collectiveView: MyBookCollectiveView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        listView.isHidden = false
        collectiveView.isHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //segment button fxn to change the UIView
    @IBAction func viewIndexChange(_ sender: UISegmentedControl) {
        
        switch viewSegmentController.selectedSegmentIndex {
        case 0:
            listView.isHidden = false
            collectiveView.isHidden = true
            
        case 1:
            listView.isHidden = true
            collectiveView.isHidden = false
            
        default:
            break
        }
    }


}
