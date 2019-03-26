//
//  CityViewController.swift
//  InClass08
//
//  Created by Jason Wei on 3/20/19.
//  Copyright © 2019 Kaifan Wei. All rights reserved.
//

import UIKit
import Alamofire

class CityViewController: UIViewController {

    var selectedCity = ""
    var selectedCountry = ""
    
    var weather: Weather!

    @IBOutlet var icon: UIImageView!
    @IBOutlet var tempLbl: UILabel!
    @IBOutlet var tempMaxLbl: UILabel!
    @IBOutlet var tempMinLbl: UILabel!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var humidityLbl: UILabel!
    @IBOutlet var windSpdLbl: UILabel!
    @IBOutlet var windDgrLbl: UILabel!
    @IBOutlet var cldLbl: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("selected city: \(selectedCity)")
        
        cityLabel.text = "\(selectedCity), \(selectedCountry)"
        
        APICall()
    }
    
    func APICall() {
        let parameters: Parameters = ["q": selectedCity, "units": "imperial", "APPID": "4059bf680aa6a12fe1e7e1208c17fd37"]

        AF.request("http://api.openweathermap.org/data/2.5/weather", parameters: parameters).responseJSON { (response) in
            let data = response.result.value as! [String: Any]
            
            let main = data["main"] as! [String: NSNumber]
            let temp = main["temp"] as! Double
            let tempMax = main["temp_max"] as! Double
            let tempMin = main["temp_min"] as! Double
            let humidity = main["humidity"] as! Double
            
            let weath = data["weather"] as! [[String: Any]]
            let desc = weath[0]["description"] as! String

            let wind = data["wind"] as! [String: NSNumber]
            let windSpd = wind["speed"] as! Double
            
            var windDgr = 0.0
            
            if wind["deg"] != nil {
                windDgr = wind["deg"] as! Double
            }

            
            let cloud = data["clouds"] as! [String: NSNumber]
            let cldn = cloud["all"] as! Double
            
            self.weather = Weather(city: self.selectedCity, temp: temp, tempMax: tempMax, tempMin: tempMin, description: desc, humidity: humidity, windSpd: windSpd, windDgr: windDgr, cldn: cldn)
            
            print("weather object initialized")
            
            self.tempLbl.text = "\(self.weather.temp) F"
            self.tempMaxLbl.text = "\(self.weather.tempMax) F"
            self.tempMinLbl.text = "\(self.weather.tempMin) F"
            self.descLbl.text = "\(self.weather.description)"
            self.humidityLbl.text = "\(self.weather.humidity)%"
            self.windSpdLbl.text = "\(self.weather.windSpd) miles/hr"
            self.windDgrLbl.text = "\(self.weather.windDgr) degrees"
            self.cldLbl.text = "\(self.weather.cldn)%"
            
            //icon
            let iconTxt = weath[0]["icon"] as! String
            let url = URL(string: "http://openweathermap.org/img/w/\(iconTxt).png")
            let imageData = try? Data(contentsOf: url!)
            if let iData = imageData {
                self.icon.image = UIImage(data: iData)
            }
            
        }
    }
    @IBAction func fcBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "forecastSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forecastSegue" {
            let destVC = segue.destination as! ForecastViewController
            destVC.selectedCity = self.selectedCity
            destVC.selectedCountry = self.selectedCountry
        }
    }
}
