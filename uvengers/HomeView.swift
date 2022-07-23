//
//  ContentView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var uv = UVInfoView()
    @State var user = UserStatusView()
    
    let backGreen = Color(0x8EB3A2)
    
    var body: some View {
        ZStack {
            backGreen.ignoresSafeArea()
            
            VStack {
                HStack {
                    // Menu button
                    Text("Burger").padding(20)
                    
                    Spacer()
                    
                    // Title
                    Text("Uvengers")
                    
                    Spacer()
                    
                    // Profile
                    Text("Profile").padding(20)
                }
                
                // User location
                Text("Redlands, CA")
            
                TabView {
                    // User status
                    user
                    
                    // UV info
                    uv
                }
                .padding(30)
                .tabViewStyle(.page)
                
                // Apply button
                Button("Apply", action: {
                    
                })
                .background(Color.red)
                .cornerRadius(30)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("1")
                    Spacer()
                    Text ("2")
                    Spacer()
                    Text("3")
                    Spacer()
                }
            }
        }
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
