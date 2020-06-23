//
//  AppConstants.swift
//  FoodManager
//
//  Created by Shawn Li on 6/22/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

struct AppConstants
{
    static let foodUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/ingredients/9266/information?amount=100&unit=gram"
    static let jokeUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/food/jokes/random"
    static let headers = [
        "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "x-rapidapi-key": "05ba5ac946mshc94e0c5090890c2p17b5a2jsnf5971f951089"
    ]
}
