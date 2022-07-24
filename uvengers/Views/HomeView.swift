//
//  ContentView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI
import ArcGIS
import CoreLocationUI


struct HomeView: View {
    
    @ObservedObject var user = UserModel()
    
    //@State private var uvView = UVInfoView()
    //@State private var userView = UserStatusView()
    
    @State private var isShowingApplyView = false
    @State private var activityType = UserModel.ActivityType.swimming
    @State private var isShowingSPFView = false
    
    @State private var spf = 50
    @State private var waterproof = false
        
    let backGreen = Color(0x8EB3A2)
    let buttonGreen = Color(0x546E75)
    
    //@StateObject var locationManager = LocationManager()
    
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
                
//                VStack {
//                    if let location = locationManager.location {
//                        Text("Your location: \(location.latitude), \(location.longitude)")
//                    }
//
//                    LocationButton {
//                        locationManager.requestLocation()
//                    }
//                    .frame(height: 44)
//                    .padding()
//                }
            
                // Center scroller
                TabView {
                    
                    // User status
                    UserStatusView(user: self.user)
                    
                    // UV info
                    UVInfoView()
                    
                    // Map (temporary)
                    SwiftUIMapView()
                }
                .padding(30)
                .tabViewStyle(.page)
                
                // Apply button
                Button(action: {
                    self.isShowingApplyView.toggle()
                    self.user.apply()
                }){
                    Text("Apply")
                        .frame(minWidth: 160, maxWidth: 160, minHeight: 80, maxHeight: 80)
                }.sheet(isPresented: $isShowingApplyView) {
                    ApplyView(selectedActivity: $user.activity)
                }
                .background(buttonGreen)
                .cornerRadius(20)
                                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // SPF Button
                    Button(action: {
                        self.isShowingSPFView.toggle()
                        self.user.updateRecommendedTime() // for testing
                    }){
                        Text("Sunscreen")
                    }.sheet(isPresented: $isShowingSPFView) {
                        SPFView(spf: $user.spf, waterproof: $user.waterproof)
                    }
                    
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
