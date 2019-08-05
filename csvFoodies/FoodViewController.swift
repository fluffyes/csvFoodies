//
//  FoodViewController.swift
//  csvFoodies
//
//  Created by Soulchild on 06/08/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit
import RealmSwift

class FoodViewController: UIViewController {
    
    @IBOutlet weak var foodTableView: UITableView!
    
    let cellIdentifier = "foodCell"
    
    var restaurant : Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = restaurant {
            self.title = "\(restaurant.name)'s Menu"
        }
        
        // Do any additional setup after loading the view.
        foodTableView.register(UINib(nibName: String(describing: FoodTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        foodTableView.dataSource = self
        foodTableView.allowsSelection = false
        foodTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension FoodViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let restaurant = restaurant else {
            return 0
        }
        
        return restaurant.foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? FoodTableViewCell,
            let restaurant = restaurant else {
                return UITableViewCell()
        }
        
        let food = restaurant.foods[indexPath.row]
        cell.nameLabel.text = food.name
        cell.priceLabel.text = "$\(food.price)"
        
        return cell
    }
}
