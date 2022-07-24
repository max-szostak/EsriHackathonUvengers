//
//  UserViewModel.swift
//  uvengers
//
//  Created by Max Szostak on 7/23/22.
//

import SwiftUI

class UserModel: ObservableObject {
    
    public enum ActivityType: String, CaseIterable, Identifiable {
        case swimming, relaxing, indoors
        var id: Self { self }
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var timebetween = 10

    @Published var timerrunning = true
    @Published var timeleft = 10
    @Published var timesince = 0
    @Published var activity = ActivityType.swimming
    
    var timeBetweenReapp = 0
    var status = "You are well protected"
    
    @Published var spf = 50
    @Published var waterproof = false
    
    var locationManager = LocationManager()
    
    func timerReceived() {
        if timeleft > 0 && timerrunning {
            timeleft -= 1
            timesince += 1
        } else {
            timerrunning = false
        }
    }
    
    func apply() {
        timeleft = timebetween
        timesince = 0
        timerrunning = true
    }
    
    func updateRecommendedTime() {
//        if let location = locationManager.lastKnownLocation {
//            let lat = location.coordinate.latitude
//            let long = location.coordinate.longitude
//
//            print(lat)
//            print(long)
//        } else {
//            print("error")
//        }
        
        
    }
    
//    func setSunscreen(spf: Int, waterproof: Bool) {
//        self.spf = spf
//        self.waterproof = waterproof
//        // todo: update recommendations
//    }
}
