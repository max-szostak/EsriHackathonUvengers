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
    
    var body: some View {
        ZStack {
            Color.green
            
            VStack{
                
                Spacer()
                
                Text("image here")
                
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
