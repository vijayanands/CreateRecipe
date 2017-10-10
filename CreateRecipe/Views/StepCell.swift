//
//  StepCell.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/10/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class StepCell: UITableViewCell {
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var units: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
