//
//  ViewController.swift
//  FoodManager
//
//  Created by Shawn Li on 6/18/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class FoodController: UIViewController
{
    let foodVM = FoodViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var jokeTV: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }

    
    func setupUI()
    {
        foodVM.updateHandler = tableView.reloadData
    }
}

extension FoodController: UITableViewDelegate, UITableViewDataSource
{
    func setupTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return foodVM.foodInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food", for: indexPath) as! FoodInfoCell
        
        return cell
    }
    
    
}
