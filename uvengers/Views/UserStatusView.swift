//
//  UserStatusView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI

struct UserStatusView: View {
    
    //@ObservedObject var user = UserModel()
    
    @ObservedObject var user:UserModel
        
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text(self.user.status).padding(20)
                
                Spacer()
                
                if user.status == "You are exposed to UV!" {
                    Image("home under uv")
                } else {
                    Image("home well protected")
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("Last application")
                        Text(String(user.timesince))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Time left")
                        Text(String(user.timeleft))
                            .onReceive(user.timer) {_ in user.timerReceived()}
                    }
                    
                    Spacer()
                }.padding(20)
            }
        }.cornerRadius(20)
    }
    
    func applyButton () {
        user.apply()
    }
}
