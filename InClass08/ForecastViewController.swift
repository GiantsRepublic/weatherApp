//
//  ForecastViewController.swift
//  InClass08
//
//  Created by Jason Wei on 3/24/19.
//  Copyright © 2019 Kaifan Wei. All rights reserved.
//

import UIKit
import Alamofire

class ForecastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectedCountry = ""
    var selectedCity = ""
    var count = 0
    var dataList = [[Any]]()
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let cellNib = UINib(nibName: "ForecastTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "myCell")
        cityLabel.text = "\(selectedCity), \(selectedCountry)"
        APICall()
    }
    
    func APICall() {
        let parameters: Parameters = ["q": selectedCity, "units": "imperial", "APPID": "4059bf680aa6a12fe1e7e1208c17fd37"]
        
        AF.request("http://api.openweathermap.org/data/2.5/forecast", parameters: parameters).responseJSON { (response) in
            let data = response.result.value as! [String: Any]
//            print(data)
            let list = data["list"] as! [[String: Any]]
//            print(list)
            for index in 0...list.count-1 {
                let time = list[index]["dt_txt"] as! String
                //self.dataList[index].append(time)
                let main = list[index]["main"] as! [String: Any]
                let temp = main["temp"] as! Double
                let tempMax = main["temp_max"] as! Double
                let tempMin = main["temp_min"] as! Double
                let humidity = main["humidity"] as! Double
                
                let weather = list[index]["weather"] as! [[String: Any]]
                var desc = ""
                if weather.isEmpty == false {
                    desc = weather[0]["description"] as! String
                }
                
                let icon = weather[0]["icon"] as! String
                let iconUrl = URL(string: "http://openweathermap.org/img/w/\(icon).png")
                let imageData = try? Data(contentsOf: iconUrl!)
//                var image: UIImage
                if let iData = imageData {
                    let image = UIImage(data: iData)!
//                    print(image)
                    //append data received to dataList
                    self.dataList.append([time, temp, tempMax, tempMin, humidity, desc, image])
                }
                
                
            }
//            print(self.dataList)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ForecastTableViewCell
        
        cell.timeLabel.text = "\(dataList[indexPath.row][0])"
        cell.tempLabel.text = "\(dataList[indexPath.row][1])F"
        cell.tempMaxLabel.text = "Max: \(dataList[indexPath.row][2])F"
        cell.tempMinLabel.text = "Min: \(dataList[indexPath.row][3])F"
        cell.humidityLabel.text = "Humidity: \(dataList[indexPath.row][4])"
        cell.descLabel.text = "\(dataList[indexPath.row][5])"
        
        //icon display
        cell.icon.image = (dataList[indexPath.row][6] as! UIImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    


}
