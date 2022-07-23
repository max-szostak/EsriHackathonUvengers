//
//  UserViewModel.swift
//  uvengers
//
//  Created by Max Szostak on 7/23/22.
//

import SwiftUI

class UserViewModel: ObservableObject{
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var timerrunning = true
    @State var timeleft = 10
    
    var timeBetweenReapp = 0
    var status = "You are well protected"
}
