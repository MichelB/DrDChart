//
//  ViewController.swift
//  PieChart
//
//  Copyright © 2019 TNODA.com. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let getRecipesData = GetRecipesData.init(cv: self,page: 1,pageSize: 10)
        getRecipesData.getCollections { [weak self] (success:Bool,recipes:Recipes)  in
            if(success){
                self!.pieChartView.slices = [
                    Slice(percent: CGFloat(recipes.nutritionPercentages[0]!/100), color: UIColor.red),
                    Slice(percent: CGFloat(recipes.nutritionPercentages[1]!/100), color: UIColor.blue),
                    Slice(percent: CGFloat(recipes.nutritionPercentages[2]!/100), color: UIColor.purple)]
                self!.pieChartView.animateChart()
            }else{
                
            }
       }
    }
}

