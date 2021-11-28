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
                  mealName: "Egg Muffin",
                  mealRecipe: """
                                Quantity :
                                - 2 eggs.
                                - Parsley 1/4 cup.
                                - Olives 2 tbsp.
                                - Onion 1/2 pcs.
                                - Tomato 1/2 pcs.
                                - A slice of low-fat cheese.

                                Method:
                                - Beat eggs with salt.
                                - Chop the onions and tomatoes and add to the eggs with parsley and olive slices.
                                - Distribute the mixture in a cupcake tray, and enter the oven for 10 or 15 minutes until the top and bottom are even.
                                - Cheese is added to it.
                                
                                """),
             Meal(mealImage: "b2",
                  mealName: "Poached eggs with tomatoes",
                  mealRecipe: """
                                
                                Quantity :
                                - 2 eggs.
                                - Whole wheat bread.
                                - Tomato sauce 1 tbsp.
                                - Green onion 1 piece.
                                - Tomato 1 piece.
                                - Olive oil.

                                Method:
                                - Boil eggs until they are level.
                                - Mix onions with tomatoes, tomato sauce, spices and olive oil.
                                - Put the peeled boiled eggs on the tomato sauce and leave on the fire for two minutes.
                                - Served with bread.
                                """),
             Meal(mealImage: "b3",
                  mealName: "Frittata",
                  mealRecipe: """
                                

                                Quantity :
                                - Kale (European lettuce) 1/2 cup.
                                - 1/2 piece of cold pepper.
                                - Low-fat feta cheese 2 tbsp.
                                - 2 eggs.

                                Method:
                                - Stir the kale on the fire with a pinch of olive oil spray, salt and pepper until it wilts.
                                - Add eggs, pepper and cheese and leave on low heat until cooked.
                                - Put the dish in the oven until browned from the top.
                                """)]


var lunchMeals = [Meal(mealImage: "l1",
                       mealName: "Potato boats",
                       mealRecipe: """
                                    Quantity :
                                    - Minced meat 2 tbsp.
                                    - olive oil 1 tbsp.
                                    - Sweet potato 1 piece.
                                    - Hot red pepper 1/2 pcs.
                                    - Light mozzarella cheese 2 tbsp.
                                    - Chopped onion 2 tbsp.
                                    - Tomato sauce 1 tbsp.

                                    Method:
                                    - Cut sweet potatoes in half and boil.
                                    - It is engraved from the text and left aside.
                                    - Filling: kosha with onions and favorite spices with olive oil.
                                    - Add meat, tomato sauce and sweet pepper and stir them over the fire.
                                    - Distribute the filling on the potatoes and add mozzarella cheese.
                                    - Put in the oven until browned on top.
                                            
                                    """),
                  Meal(mealImage: "l2",
                       mealName: "Chicken Teriyaki",
                       mealRecipe: """
                                                  Quantity :
                                                  - 1/2 red onion
                                                  - Carrots 1 piece.
                                                  - 1/2 piece of cold pepper.
                                                  - 1/2 piece hot pepper.
                                                  - Salt, black pepper and garlic powder 1 tsp.
                                                  - Minced ginger 1 tsp.
                                                  - Garlic 1 piece.
                                                  - Chicken breast 1 piece.
                                                  - 1/2 cup boiled rice.
                                                  - Soy sauce 2 tablespoons.
                                                  - 1 green onion.
                                                  - Sesame 1 tbsp.
                                                  - Starch 1 tbsp.
                                                  
                                                  Method:
                                                  - Fry the chicken in a hot frying pan using olive oil spray with the addition of spices and salt .
                                                  - Cut vegetables into slices: onions - carrots - cold pepper.
                                                  - After the chicken is done, add the vegetables with hot pepper, garlic and ginger with a little water, cover the pot and leave it on a low heat until it is done.
                                                  - Remove the soy sauce and starch with about a quarter cup of water and add it to the chicken and vegetables.
                                                  - Garnish the dish with green pepper and sesame.
                                                  - Served with boiled rice.
                                                  
                                                  """),
                  Meal(mealImage: "l3",
                       mealName: "Chicken tray with vegetables",
                       mealRecipe: """
                                  Quantity :
                                  - Sweet potato 1 piece.
                                  - Carrots 1 piece.
                                  - Coriander sticks 1/4 cup.
                                  - Zucchini 1 piece.
                                  - Chicken.

                                  Method:
                                  - Cut the chicken and vegetables into large cubes and season with olive oil, spices, salt and black pepper.
                                  - Put the ingredients in a tray, pour about a quarter cup of water over it, and cover the tray with aluminum foil.
                                  - Put the tray in the oven until it's level, and remove the aluminum foil until it turns red from the top.
                                  - Served with bread.
                                                  
                                """),]


var dinnerMeals = [Meal(mealImage: "d1",
                       mealName: "Salmon Steak",
                       mealRecipe: """
                                    Quantity :
                                    - Parsley 1 tbsp.
                                    - 1/4 cup boiled rice.
                                    - Honey 1/2 tbsp.
                                    - Salmon.
                                    - Lemon 1 piece.
                                    - Garlic mashed 1 piece.
                                    - Chili powder 1 tsp.
                                    - Salt and black pepper 1 tsp.

                                    Method:
                                    - Mix honey, lemon juice, mashed garlic, black pepper, salt and chili powder.
                                    - Marinate the fish and leave it in the refrigerator for an hour.
                                    - It is preferable to use a non-stick frying pan and spray with olive oil, then put the salmon steak and cover it.
                                    - After the first side is flat, flip it over.
                                    - Served with boiled rice.
                                            
                                """),
                  Meal(mealImage: "d2",
                       mealName: "Oat Soup",
                       mealRecipe: """
                                      Quantity :
                                      - 1/2 onion slices.
                                      - Tomato juice 1 tablet.
                                      - Tomato sauce 1 tsp.
                                      - Salt, black pepper, mixed spices, black lemon 1 tbsp.
                                      - oats.
                                      
                                      Method:
                                      - Mix onions with spices and spray with olive oil spray.
                                      - Add the rest of the ingredients to the couscous.
                                      - Add 1 cup of water or according to the oats.
                                      - Leave on low heat for 20-30 minutes.
                                      
                                    """),
                   Meal(mealImage: "d3",
                       mealName: "Avocado Pasta",
                       mealRecipe: """
                                      Quantity :
                                      - Garlic clove 1 piece.
                                      - Spinach 1 cup.
                                      - Lemon juice 1 tablespoon.
                                      - Chicken breast 1 piece.
                                      - Avocado 1/2 pcs.
                                      - Parmesan cheese 2 tablespoons.
                                      - Whole wheat pasta 1/2 cup.

                                      Method:
                                      - Climb the pasta.
                                      - Chop the onions and fry and add the chicken.
                                      - Add garlic, spices, salt, black pepper and oregano.
                                      - In a food processor, put spinach, avocado, garlic and lemon juice.
                                      - Add the mixture to the chicken and stir for 5 minutes on the stove.
                                      - Add pasta to them, cover and simmer over low heat for 10 minutes.
                                      - After it is done, sprinkle cheese on it and serve.
                                      
                                    """),]
