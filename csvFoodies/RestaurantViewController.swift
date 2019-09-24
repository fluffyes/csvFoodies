//
//  RestaurantViewController.swift
//  csvFoodies
//
//  Created by Soulchild on 05/08/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit
import RealmSwift

class RestaurantViewController: UIViewController {

    @IBOutlet weak var restaurantsTableView: UITableView!
    
    var realm : Realm!
    
    let cellIdentifier = "restaurantCell"
    
    var restaurants : Results<Restaurant>?
    var selectedRestaurant : Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read the foodies.realm file
        let realmPath = Bundle.main.url(forResource: "foodies",
                                        withExtension: "realm")!
        
        // configure to read only as file located in Bundle is not writeable
        let realmConfiguration = Realm.Configuration(fileURL:
            realmPath, readOnly: true)
        realm = try! Realm(configuration: realmConfiguration)
        
        self.title = "Restaurants"
        
        restaurants = realm.objects(Restaurant.self)
        
        // Do any additional setup after loading the view.
        restaurantsTableView.register(UINib(nibName: String(describing: RestaurantTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        restaurantsTableView.dataSource = self
        restaurantsTableView.delegate = self
        restaurantsTableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "RestaurantToFoodSegue") {
            if let foodVC = segue.destination as? FoodViewController {
                foodVC.restaurant = selectedRestaurant
            }
        }
    }
}

extension RestaurantViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let restaurants = restaurants else {
            return 0
        }
        
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? RestaurantTableViewCell,
              let restaurants = restaurants else {
            return UITableViewCell()
        }
        
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.sloganLabel.text = restaurant.slogan
        
        return cell
    }
}

extension RestaurantViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let restaurants = restaurants {
            selectedRestaurant = restaurants[indexPath.row]
        }
        
        performSegue(withIdentifier: "RestaurantToFoodSegue", sender: self)
    }
}
