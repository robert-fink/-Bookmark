//
//  NYTBookFavoriteVC.swift
//  Bookmark
//
//  Created by Mike Witter on 5/2/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class NYTBookFavoriteVC: UIViewController {
    
    var nytBestSellerModel: NYTBestSellerModel!
    var books = [NYTBestSellerModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = nytBestSellerModel.loadJSON(fileName: "NYTimeBestSeller")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
