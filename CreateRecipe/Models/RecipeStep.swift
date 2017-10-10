//
//  RecipeStep.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/10/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class RecipeStep: NSObject {
	var stepIngredients:[RecipeIngredient] = []
    var stepDescription: String?
    
    func customInit(with ingredients: [RecipeIngredient]! , stepDescription: String?) {
        self.stepIngredients = ingredients
        self.stepDescription = stepDescription
    }
	
	func ingregientsString() -> String {
		let count = stepIngredients.count as Int
		var ingredientsString = ""
		for i in 0 ..< count {
			ingredientsString += stepIngredients[i].toString()
			if i < count-1 {
				ingredientsString = ingredientsString + "\n"
			}
		}
		return ingredientsString
	}
}
