import UIKit

func getData() {
    let urlString = "https://api.sunrise-sunset.org/json?date=2020-8-1&lng=37.3230&lat=-122.0322&formatted=0"
    
    guard let url = URL(string: urlString) else {
        return
    }
    
    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        var result: APIResponse?
        
        do {
            result = try JSONDecoder().decode(APIResponse.self, from: data)//decode하길 원하는 것, 어디서
        }
        catch {
            print("Failed to decode with error: \(error)")
        }
        
        guard let final = result else {
            return
        }
        
        print(final.results.sunrise)
        print(final.results.sunset)
        print(final.results.day_length)
        
    })
    task.resume()
}

getData()

struct APIResponse: Codable {
    let results: APIResponseResults
    let status: String
    
}

struct APIResponseResults: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}
