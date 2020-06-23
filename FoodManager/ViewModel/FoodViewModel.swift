//
//  FoodViewModel.swift
//  FoodManager
//
//  Created by Shawn Li on 6/18/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class FoodViewModel
{
    var foodInfo = [FoodInfo]()
    var foodJoke = [Joke]()
    let dispatchGroup = DispatchGroup()
    var updateHandler: () -> () = {}
    
    init()
    {
        fetchDataGroup()
    }
    
    func fetchFoodInfo(url: String)
    {
        
        Service.shared.fetchData(url: url)
        { (data) in
            guard let foodData = data else {return}
            
            do
            {
                self.foodInfo = try JSONDecoder().decode([FoodInfo].self, from: foodData)
                self.dispatchGroup.leave()
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchFoodJoke(url: String)
    {
        Service.shared.fetchData(url: url)
        { (data) in
            guard let jokeData = data else {return}
            
            do
            {
                self.foodJoke = try JSONDecoder().decode([Joke].self, from: jokeData)
                self.dispatchGroup.leave()
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func fetchDataGroup()
    {
        dispatchGroup.enter()
        fetchFoodInfo(url: AppConstants.foodUrl)
        
        dispatchGroup.enter()
        fetchFoodJoke(url: AppConstants.jokeUrl)
        
        dispatchGroup.notify(queue: DispatchQueue.main)
        {
            self.updateHandler()
        }
    }
}
