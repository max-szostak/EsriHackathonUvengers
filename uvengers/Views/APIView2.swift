
import Foundation


func callAPI() async -> String{
    let URL_API_KEY = "dcffc778de2a4c6033399aa09c949bfe"
    var URL_LATITUDE = "47.740"
    var URL_LONGITUDE = "-122.374"
    var URL_GET_ONE_CALL = ""
    let URL_BASE = "https://api.openweathermap.org/data/3.0"
    //let session = URLSession(configuration: .default)

    func setLatitude(_ latitude: String) {
        URL_LATITUDE = latitude
    }
    
    func setLatitude(_ latitude: Double) {
        setLatitude(String(latitude))
    }
    
    func setLongitude(_ longitude: String) {
        URL_LONGITUDE = longitude
    }
    
    func setLongitude(_ longitude: Double) {
        setLongitude(String(longitude))
    }
    
    func buildURL() -> String {
        URL_GET_ONE_CALL = "/onecall?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&exclude=minutely,hourly,daily,alerts&units=imperial" + "&appid=" + URL_API_KEY
        return URL_BASE + URL_GET_ONE_CALL
    }
    let myURL = buildURL()
    guard let url = URL(string: myURL) else{
        return "pass"
    }

    var returnString = "error"
    let task = try await URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            returnString = string
            print(string)
        }
    }
    
    task.resume()
    
    return returnString
}

//let jsonData = callAPI()

//let index = jsonData.range(of: "\"uvi\":")!.lowerBound

