//
//  weather.swift
//  weather
//
//  Created by Aleksandr Nikiforov on 17.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Foundation

class Weather {
    
    var finished = false
    var apiLaunched = false
    
    func getTemp(location: String) -> String {
        apiLaunched = true
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Tallinn&appid=53c5a78495359ac3dafb611967438aef") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if data != nil {
                        do {
                            let json = try JSON(data: data!)
                            let temp = json["main"]["temp"].stringValue
                            return temp
                        } catch {
                            
                        }
                    }
                }
                
                self.finished = true
            }.resume()
        }
        return ""
    }
    
}
