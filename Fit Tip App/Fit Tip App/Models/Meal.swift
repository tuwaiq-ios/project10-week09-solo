//
//  Meal.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 22/04/1443 AH.
//

import UIKit

struct Meal {
    
    let mealImage: String
    let mealName: String
    let mealRecipe: String
    
}

var breakfastMeals = [Meal(mealImage: "b1",
                  mealName: NSLocalizedString("egg_muffin", comment: ""),
                  mealRecipe: NSLocalizedString("egg_muffin_desc", comment: "")),
             Meal(mealImage: "b2",
                  mealName: NSLocalizedString("poached", comment: "") ,
                  mealRecipe:  NSLocalizedString("poached_desc", comment: "")),
             Meal(mealImage: "b3",
                  mealName: NSLocalizedString("frittata", comment: ""),
                  mealRecipe: NSLocalizedString("frittata_desc", comment: ""))]


var lunchMeals = [Meal(mealImage: "l1",
                       mealName: NSLocalizedString("potato", comment: ""),
                       mealRecipe: NSLocalizedString("potato_desc", comment: "")),
                  Meal(mealImage: "l2",
                       mealName: NSLocalizedString("chicken", comment: ""),
                       mealRecipe: NSLocalizedString("chicken_desc", comment: "")),
                  Meal(mealImage: "l3",
                       mealName: NSLocalizedString("chicken_vegetables", comment: ""),
                       mealRecipe: NSLocalizedString("chicken_vegetables_desc", comment: "")),]


var dinnerMeals = [Meal(mealImage: "d1",
                       mealName: NSLocalizedString("salmon", comment: ""),
                       mealRecipe: NSLocalizedString("salmon_desc", comment: "")),
                  Meal(mealImage: "d2",
                       mealName: NSLocalizedString("oat", comment: ""),
                       mealRecipe: NSLocalizedString("oat_desc", comment: "")),
                   Meal(mealImage: "d3",
                       mealName: NSLocalizedString("avocado", comment: ""),
                       mealRecipe: NSLocalizedString("avocado_desc", comment: "")),]
