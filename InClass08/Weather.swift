//
//  Weather.swift
//  InClass08
//
//  Created by Jason Wei on 3/21/19.
//  Copyright © 2019 Kaifan Wei. All rights reserved.
//

import Foundation

class Weather {
    var city: String
    var temp: Double
    var tempMax: Double
    var tempMin: Double
    var description: String
    var humidity: Double
    var windSpd: Double
    var windDgr: Double
    var cldn: Double
    
    init(city: String, temp: Double, tempMax: Double, tempMin: Double, description: String, humidity: Double, windSpd: Double, windDgr: Double, cldn: Double) {
        self.city = city
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.description = description
        self.humidity = humidity
        self.windSpd = windSpd
        self.windDgr = windDgr
        self.cldn = cldn
    }
}
