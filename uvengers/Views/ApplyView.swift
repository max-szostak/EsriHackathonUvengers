//
//  ApplyView.swift
//  uvengers
//
//  Created by Max Szostak on 7/23/22.
//

import SwiftUI

struct ApplyView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @Binding var selectedActivity:UserModel.ActivityType
    
    let offwhite = Color(0xF4F7F0)
    
    var body: some View {
        ZStack {
            offwhite
            
            VStack {
                Spacer()
                
                Image("activity")
                
                Spacer().frame(height: 50)
                
                Picker("Activity", selection:$selectedActivity) {
                    ForEach(UserModel.ActivityType.allCases) {activity in
                        Text(activity.rawValue.capitalized)
                            .accessibilityLabel(activity.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(10)
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image("apply button")
                }.accessibilityLabel("apply")
                
                Spacer()
            }
        }
    }
}
