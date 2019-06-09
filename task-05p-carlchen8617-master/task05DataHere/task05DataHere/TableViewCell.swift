//
//  TableViewCell.swift
//  task05DataHere
//
//  Created by Carl Chen on 10/4/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
   
    @IBOutlet weak var column1: UILabel!
    @IBOutlet weak var column2: UILabel!
    @IBOutlet weak var column3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
