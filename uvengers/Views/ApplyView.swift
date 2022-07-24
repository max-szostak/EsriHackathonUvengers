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
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Spacer()
                
                Picker("Activity", selection:$selectedActivity) {
                    ForEach(UserModel.ActivityType.allCases) {activity in
                        Text(activity.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding(10)
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Confirm")
                }
                
                Spacer()
            }
        }
    }
}
