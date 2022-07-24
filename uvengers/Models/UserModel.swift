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
    @Published var timeleft = 5
    @Published var timesince = 0
    @Published var activity = ActivityType.swimming {
        didSet {
            updateRecommendedTime()
        }
    }
    @Published var status = "You are well protected!"
        
    @Published var spf = 50
    @Published var waterproof = false {
        didSet {
            updateRecommendedTime()
        }
    }
    
    var locationManager = LocationManager()
    
    func timerReceived() {
        if timeleft > 0 && timerrunning {
            timeleft -= 1
            timesince += 1
        } else {
            updateStatus()
            timerrunning = false
        }
    }
    
    func apply() {
        timeleft = timebetween
        timesince = 0
        timerrunning = true
        updateStatus()
    }
    
    func updateRecommendedTime() {
        if (activity == ActivityType.indoors) {
            timebetween = 6*60
        } else if (waterproof || activity == ActivityType.relaxing) {
            timebetween = 120 // 2 hrs
        } else if (activity == ActivityType.swimming) {
            timebetween = 40 // 40 mins
        } else {
            timebetween = 120 // 6 hrs
        }
        timeleft = timebetween
        timesince = 0
    }
    
    func updateStatus() {
        if (timeleft <= 0) {
            status = "You are exposed to UV!"
        } else {
            status = "You are well protected!"
        }
    }

}
