import Foundation

class Weather {
    
    var finished = false
    var apiLaunched = false
    
    func getTemp(location: String) -> Void {
        apiLaunched = true
        
        let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
 
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(encodedLocation!)&appid=53c5a78495359ac3dafb611967438aef") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if data != nil {
                        do {
                            let json = try JSON(data: data!)
                            let temp = json["main"]["temp"].floatValue
                            print("Temp at \(location) is: \(temp - 273.1) C")
                        } catch {
                            
                        }
                    }
                }
                self.finished = true
            }.resume()
        } else {
            self.finished = true
        }
    }
    
}
