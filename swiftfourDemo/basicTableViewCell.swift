//
//  basicTableViewCell.swift
//  swiftfourDemo
//
//  Created by agile-m-32 on 14/11/17.
//  Copyright © 2017 agile-m-32. All rights reserved.
//

import UIKit

class basicTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblContent: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
