//
//  UVInfoView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI
import CoreLocationUI

struct UVInfoView: View {
    
    let offwhite = Color(0xF4F7F0)
    
    @State private var message = "Loading..."
    @StateObject var locationManager = LocationManager()
    @State private var uvi = 0.0
    @State var status = "Status: low"

    
    var body: some View {
        ZStack {
            offwhite
            
            VStack {
                
                LocationButton {
                                locationManager.requestLocation()
                            }
                            .frame(height: 44)
                            .padding()
                
                // User location
                if let location = locationManager.location {
                    VStack {
                    Text("Your location: \(location.latitude), \(location.longitude)")
                    Text("UV index: " + message)
                        .task {
                            do {
                                //locationManager.requestLocation()
                                print("here")
                                if let location = locationManager.location {
                                    print("foobar")
                                    let lat = location.latitude
                                    let long = location.longitude
                                    await callAPI(lat: lat, long: long)
                                    uvi = Double(message) ?? 0
                                    if uvi < 5 {
                                        print(String(uvi))
                                        status = "Status: low"
                                    } else {
                                        status = "Status: high"
                                    }
                                }
                                print("if failed")

                            } catch {
                                message = "Failed to load"
                            }
                        }
                        Text(status)
                    
                    }
                }
                
                if uvi < 6 {
                    Image("home low uv")
                } else {
                    Image("home high uv")
                }
            }
            
        
            
        }.cornerRadius(20)
    }
    
    func callAPI(lat: Double, long: Double) async {
        let URL_API_KEY = "dcffc778de2a4c6033399aa09c949bfe"
        print(String(lat))
        print(String(long))
        var URL_LATITUDE = String(lat)
        var URL_LONGITUDE = String(long)
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
            return
        }

        let task = try await URLSession.shared.dataTask(with: url){
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8){
                message = string
                
                
                if let startIndex = message.range(of: "\"uvi\":") {
                    let start = message.index(startIndex.lowerBound, offsetBy:6)
                    let end = message.index(start, offsetBy: 4)
                    let range = start..<end

                    message = String(message[range])  // play
                    
                    
                    //message = String(message[startIndex.upperBound...startIndex.upperBound+4])
                } else {
                    message = "error"
                }
                print(string)
            }
        }
        
        task.resume()
    }
}


