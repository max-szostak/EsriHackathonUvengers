//
//  UVInfoView.swift
//  uvengers
//
//  Created by Max Szostak on 7/22/22.
//

import SwiftUI

struct UVInfoView: View {
    
    let offwhite = Color(0xF4F7F0)
    
    @State private var uvi:Double = 5
    
    var body: some View {
        ZStack {
            offwhite
            
            VStack {
                Text("uv low")
                
                Image("home low uv")
            }
            
        
            
        }.cornerRadius(20)
    }
}
