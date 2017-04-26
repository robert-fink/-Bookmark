//
//  ProfileViewController.swift
//  Bookmark
//
//  Created by Leo Kim on 4/26/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    //segment controller
    @IBOutlet weak var tableViewSegmentController: UISegmentedControl!
    
    //the UI Views - List and Collective
    @IBOutlet weak var listViewUIView: UIView!
    @IBOutlet weak var collectiveViewUIView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        listViewUIView.isHidden = false
        collectiveViewUIView.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func tableViewSegmentChange(_ sender: UISegmentedControl) {
        
        switch tableViewSegmentController.selectedSegmentIndex {
        
        case 0:
            listViewUIView.isHidden = false
            collectiveViewUIView.isHidden = true
            
        case 1:
            listViewUIView.isHidden = true
            collectiveViewUIView.isHidden = false
            
        default:
            break
            
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
