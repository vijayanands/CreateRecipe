//
//  RecipeIngredient.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/10/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class RecipeIngredient: NSObject {
    var name: String = ""
    var amount: String = ""
    var units: String = ""
    
    init(with name: String, amount: String, units: String) {
        self.name = name
        self.amount = amount
        self.units = units
    }
	
	func toString() -> String {
		return "\(name) : \(amount) \(units)"
	}
}
