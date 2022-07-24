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
    
    @State private var isShowingApplyView = false
    @State private var activityType = UserModel.ActivityType.swimming
    
    @State private var spf = 50
    @State private var waterproof = false
        
    let buttonGreen = Color(0x546E75)
    let backGreen = Color(0x8EB3A2)

    @State private var tabSelection = 2
    
    var body: some View {
        TabView (selection: $tabSelection) {
            // Shop tab
            ShopView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Label("Shop", image: "chop icon")
                }
                .tag(0)
            
            // SPF Tab
            SPFView(spf: $user.spf, waterproof: $user.waterproof)
                .tabItem {
                    Label("My sunscreen", image: "Sunscreen icon")
                }
                .tag(1)
            
            //Home tab
            ZStack {
                backGreen
                
                VStack {
                    
                
                    // Center scroller
                    TabView {
                        
                        // User status
                        UserStatusView(user: self.user)
                        
                        // UV info
                        UVInfoView()
                        
                        // Map (temporary)
                        
                    }
                    .padding(30)
                    .tabViewStyle(.page)
                    
                    // Apply button
                    Button(action: {
                        self.isShowingApplyView.toggle()
                        self.user.apply()
                        
                    }){
                        Image("apply button")
                    }.sheet(isPresented: $isShowingApplyView) {
                        ApplyView(selectedActivity: $user.activity)
                    }
                    .accessibilityLabel("apply")
                    
                    Spacer()
                }
            }
            .tabItem {
                Label("Home", systemImage: "house")
                }
            .tag(2)
            
            SwiftUIMapView()
                .tabItem {
                    Label("UV Map", systemImage: "map")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Label("Settings", systemImage: "gear").scaledToFit()
                }
                .tag(4)
                .scaledToFit()
        }
    }
}
