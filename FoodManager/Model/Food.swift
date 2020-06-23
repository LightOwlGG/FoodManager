//
//  Food.swift
//  FoodManager
//
//  Created by Shawn Li on 6/21/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

struct FoodInfo: Decodable
{
    var id: Int
    var name: String
    var aisle: String
    var image: String
    var amount: Int
    var unit: String
    var nutrition: Nutrition
}

struct Nutrition: Decodable
{
    var nutrients: [Nutrients]
    var caloricBreakdown: Caloric
}

struct Nutrients: Decodable
{
    var title: String
    var amount: Int
    var unit: String
    var percentOfDailyNeeds: Double
}

struct Caloric: Decodable
{
    var percentProtein: Double
    var percentFat: Double
    var percentCarbs: Double
}

struct Joke: Decodable
{
    var text: String
}
