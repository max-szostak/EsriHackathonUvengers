//
//  ContentView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        
        TabView {
            // UV info
            Color.blue
            
            // User status
            Color.black
        }
        .padding(30)
        .tabViewStyle(.page)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
