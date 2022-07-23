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
    
    var body: some View {
        
        VStack {
            HStack {
                
            }
        
            TabView {
                // UV info
                uv
                
                // User status
                user
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
