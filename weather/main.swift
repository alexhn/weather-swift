//
//  main.swift
//  weather
//
//  Created by Aleksandr Nikiforov on 17.05.2020.
//  Copyright © 2020 Aleksandr Nikiforov. All rights reserved.
//

import Foundation

print("Hello, World!")
//
//for arg in CommandLine.arguments {
//    print(arg)
//}

let weather = Weather()

while !weather.finished {
    if (!weather.apiLaunched) {
        let temperature = weather.getTemp(location: "Tallinn")
        print("Temp: \(temperature) F")
    }
}
