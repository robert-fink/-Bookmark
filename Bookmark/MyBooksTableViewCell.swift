//
//  MyBooksTableViewCell.swift
//  Bookmark
//
//  Created by Dale Brauer on 5/8/17.
//  Copyright © 2017 Fink, Robert. All rights reserved.
//

import UIKit

class MyBooksTableViewCell: UITableViewCell {
    @IBOutlet weak var MyBookTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
