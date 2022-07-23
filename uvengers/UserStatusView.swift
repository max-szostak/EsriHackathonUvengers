//
//  UserStatusView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI

struct UserStatusView: View {
    
    @StateObject var user = UserViewModel()
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text(user.status).padding(20)
                
                Spacer()
                
                Text("image here")
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("Last application")
                        Text(String(0))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Time left")
                        Text(String(user.timeleft))
                            .onReceive(user.timer, perform: {_ in
                                if user.timeleft > 0 && user.timerrunning {
                                    user.timeleft -= 1
                                } else {
                                    user.timerrunning = true
                                }
                            })
                    }
                    
                    Spacer()
                }.padding(20)
            }
        }
    }
}
