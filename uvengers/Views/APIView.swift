//
//  ContentView.swift
//  Uvenger
//
//  Created by Xinbo Lu on 7/22/22.
//
//
import SwiftUI

struct Response: Codable{
    var lat:Double
    var lon: Double
    var timezone: String
    var timezone_offset: String
    var weather: [CurrentWeather1]
}

struct CurrentWeather1: Codable{
    var dt: Date
    var temp: Double
    var feels_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var uvi: Double
    var clouds: Int
    var visibility: Int
    var wind_speed: Double
    var wind_deg: Int
    var wind_gust: Double
}



struct APIView: View {
    @State private var result = [CurrentWeather1]()
    var body: some View {
        List{
            //Text(await callAPI())
        }
        .task {
            print("here")
            //await loadData()
            await callAPI()
        }
    
    }
    
//    func callAPI() -> String{
//        var URL_API_KEY = "dcffc778de2a4c6033399aa09c949bfe"
//        var URL_LATITUDE = "47.740"
//        var URL_LONGITUDE = "-122.374"
//        var URL_GET_ONE_CALL = ""
//        var URL_BASE = "https://api.openweathermap.org/data/3.0"
//        //let session = URLSession(configuration: .default)
//
//    func setLatitude(_ latitude: String) {
//            URL_LATITUDE = latitude
//        }
//
//    func setLatitude(_ latitude: Double) {
//            setLatitude(String(latitude))
//        }
//
//    func setLongitude(_ longitude: String) {
//            URL_LONGITUDE = longitude
//        }
//
//    func setLongitude(_ longitude: Double) {
//            setLongitude(String(longitude))
//        }
//
//    func buildURL() -> String {
//            URL_GET_ONE_CALL = "/onecall?lat=" + URL_LATITUDE + "&lon=" + URL_LONGITUDE + "&exclude=minutely,hourly,daily,alerts&units=imperial" + "&appid=" + URL_API_KEY
//            return URL_BASE + URL_GET_ONE_CALL
//        }
//
    func loadData() async{
        
        guard let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=47.73942710855307&lon=-122.36425944018359&exclude=minutely,hourly,daily,alerts&appid=dcffc778de2a4c6033399aa09c949bfe") else {
            print("Invalid API ")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                result = decodedResponse.weather //Cannot assign value of type '[CurrentWeather1]' to type '[Response]'
                print(result)
                print("result")
            }
        }catch {
            print("invalid data")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
