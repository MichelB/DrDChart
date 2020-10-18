//
//  GetRecipesData.swift
//  DrD
//
//  Created by Michel Bardawil on 16/10/2020.
//  Copyright © 2020 DrD. All rights reserved.
//

import UIKit
import Apollo

class GetRecipesData {
    var page:Int;
    var pageSize:Int;
    
    let cv:UIViewController
    init(cv:UIViewController,page:Int,pageSize:Int) {
        self.cv = cv
        self.page = page
        self.pageSize = pageSize
    }

    func getCollections(completion: @escaping ((_ success: Bool, _ recipes: Recipes) -> Void)) {
 
        Network().apollo.fetch(query:GetRecipesQuery(page: page, pageSize: page)){ (result) in
            var recipesObj:Recipes!
            do {
                let listRecipes = try result.get().data?.listRecipes.recipes[0]
                print(listRecipes)
                let id = try result.get().data?.listRecipes.recipes[0]?.id
                let title = try result.get().data?.listRecipes.recipes[0]?.title
                let description = try result.get().data?.listRecipes.recipes[0]?.description
                
                
                let nutritionValues:[Double?] = [listRecipes?.nutrition.values.carbs,listRecipes?.nutrition.values.fat,listRecipes?.nutrition.values.protein,listRecipes?.nutrition.values.calories,listRecipes?.nutrition.values.fiber]
              
                let nutritionPercentages:[Double?] = [listRecipes?.nutrition.percentages.carbs,listRecipes?.nutrition.percentages.fat,listRecipes?.nutrition.percentages.protein]
                
                recipesObj = Recipes(id: id!, title: title!, description: description!, nutritionValues: nutritionValues, nutritionPercentages: nutritionPercentages)

                completion(true,recipesObj)
              } catch {
                    print(error)
                completion(false,recipesObj)
              }
            
            
        }
    }
} 
