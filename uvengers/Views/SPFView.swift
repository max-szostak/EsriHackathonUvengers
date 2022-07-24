//
//  SPFView.swift
//  uvengers
//
//  Created by Max Szostak on 7/23/22.
//

import SwiftUI

struct SPFView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>

    @Binding var spf: Int
    @Binding var waterproof: Bool
    
    let backGreen = Color(0x8EB3A2)

    
    var body: some View {
        ZStack {
            backGreen
            
            VStack{
                
                Spacer()
                
                Image("sunscreen")
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                        
                    Text("SPF")
                        
                    TextField("SPF:", value: $spf, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .padding(20)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                }.frame(width: 150)
                
                Spacer().frame(height: 30)
                
                Toggle("Waterproof", isOn: $waterproof)
                    .frame(width: 150)
                
                Spacer()
            }
        }
    }

}
