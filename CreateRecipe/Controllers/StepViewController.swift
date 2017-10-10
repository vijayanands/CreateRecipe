//
//  StepViewController.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/9/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {
    @IBOutlet weak var ingredientName: UITextField!
    @IBOutlet weak var ingredientAmount: UITextField!
    @IBOutlet weak var amountUnits: UITextField!
    @IBOutlet weak var stepsTable: UITableView!
	@IBOutlet weak var stepDescription: UITextField!
	@IBOutlet weak var stepLabel: UILabel!
	
	var stepIngredients:[RecipeIngredient] = []
    var steps:[RecipeStep] = []
	var currentStep = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stepsTable.delegate = self
        stepsTable.dataSource = self
        stepsTable.reloadData()
		stepsTable.rowHeight = UITableViewAutomaticDimension
		currentStep = 1
		setStepLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func clearStep(_ sender: Any) {
		clearAllStepInfo()
	}
	
	@IBAction func saveStep(_ sender: Any) {
        let recipeStep = RecipeStep()
        recipeStep.customInit(with: stepIngredients, stepDescription: stepDescription.text)
        steps.append(recipeStep)
		clearAllStepInfo()
		currentStep += 1
		setStepLabel()
		stepsTable.reloadData()
    }
    
    @IBAction func onAdd(_ sender: Any) {
        let recipeIngredient = RecipeIngredient(with: ingredientName.text!, amount: ingredientAmount.text!, units: amountUnits.text!)
        stepIngredients.append(recipeIngredient)
        stepsTable.reloadData()
		clearStepInput()
    }
	
	private func setStepLabel() {
		stepLabel.text = "\(currentStep) :"
	}
	
	private func clearStepInput() {
		ingredientName.text = ""
		ingredientAmount.text = ""
		amountUnits.text = ""
	}

	private func clearAllStepInfo() {
		clearStepInput()
		self.stepIngredients.removeAll()
		stepDescription.text = ""
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let destinationViewController = segue.destination as! UINavigationController
        let recipeViewController = destinationViewController.topViewController as! RecipeViewController
        recipeViewController.customInit(steps: steps)
    }

}

extension StepViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepCell", for: indexPath) as! StepCell
        cell.ingredient.text = stepIngredients[indexPath.row].name
        cell.amount.text = stepIngredients[indexPath.row].amount
        cell.units.text = stepIngredients[indexPath.row].units
        return cell
    }
}
