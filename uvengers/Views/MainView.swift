//
//  MainView.swift
//  uvengers
//
//  Created by Max Szostak on 7/23/22.
//
import SwiftUI

struct MainView: View {
        
    @State var showMenu = false
    let backGreen = Color(0x8EB3A2)

    
    var body: some View {
        ZStack {
            backGreen.ignoresSafeArea()
            
            VStack {
                // Upper toolbar
                HStack {
                    // Menu button
                    Button(action: {
                        self.openMenu()
                    }, label: {
                        Image("hamburger").padding(20)
                    })
                    
                    Spacer()
                    
                    // Title
                    Image("Logo")
                    
                    Spacer()
                    
                    // Profile
                    Image("Profile").padding(20)
                }
                
                HomeView()
            }
        }
    }
    
    func openMenu() {
        self.showMenu.toggle()
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

