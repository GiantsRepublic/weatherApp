//
//  ViewController.swift
//  InClass08
//
//  Created by Jason Wei on 3/20/19.
//  Copyright © 2019 Kaifan Wei. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var list = AppData().cities
    var countries = [String]()
    var selectedCity = ""
    var selectedCountry = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries.append(contentsOf: list.keys)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list[countries[section]]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let country = countries[indexPath.section]
        let city = list[country]![indexPath.row]
        cell.textLabel?.text = city
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countries[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.section]
        let city = list[country]![indexPath.row]
        selectedCity = city
        selectedCountry = country
        print("\(city), \(country)")
        performSegue(withIdentifier: "citySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! CityViewController
        destVC.selectedCity = self.selectedCity
        destVC.selectedCountry = self.selectedCountry
    }
}

