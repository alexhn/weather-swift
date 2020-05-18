import Foundation

print("Hello, World!")

let weather = Weather()

if CommandLine.arguments.count <= 1 {
    print("You need to provide a location.")
} else {
    var location = ""
    for index in 0..<CommandLine.arguments.count {
        if (index != 0) {
            location += CommandLine.arguments[index] + " "
        }
    }
    while !weather.finished {
        if (!weather.apiLaunched) {
            weather.getTemp(location: location)
        }
    }

}
