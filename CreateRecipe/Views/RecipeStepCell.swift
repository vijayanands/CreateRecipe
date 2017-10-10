//
//  RecipeStepCell.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/10/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class RecipeStepCell: UITableViewCell {
    @IBOutlet weak var stepNumber: UILabel!
	var stepIngredients:[RecipeIngredient] = []
    @IBOutlet weak var ingredientsList: UILabel!
    @IBOutlet weak var stepDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
