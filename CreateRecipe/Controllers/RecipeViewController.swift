//
//  RecipeViewController.swift
//  CreateRecipe
//
//  Created by Vijayanand on 10/9/17.
//  Copyright © 2017 Vijayanand. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeStepsTable: UITableView!
    var recipeSteps: [RecipeStep]!
    
    func customInit(steps: [RecipeStep]) {
        recipeSteps = steps
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeStepsTable.delegate = self
        recipeStepsTable.dataSource = self
        recipeStepsTable.reloadData()
		recipeStepsTable.estimatedRowHeight = 100
		recipeStepsTable.rowHeight = UITableViewAutomaticDimension
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

extension RecipeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeSteps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeStepCell", for: indexPath) as! RecipeStepCell
        cell.stepNumber.text = String("\(indexPath.row + 1)")
        cell.stepDescription.text = recipeSteps[indexPath.row].stepDescription
        cell.ingredientsList.text = recipeSteps[indexPath.row].ingregientsString()
		cell.stepNumber.text = "Step \(indexPath.row + 1): "
        return cell
    }	
}
