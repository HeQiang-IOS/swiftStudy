//
//  ProfileEditor.swift
//  App-Design-and-Layout
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List{
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()

                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) {
                        season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }.padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Goal Date").bold()
                DatePicker(
                    "Goal Date",
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date
                )
            }.padding(.top)
        }
        .onTapGesture {
//            let keyWindow = UIApplication.shared.connectedScenes
//                    .filter({$0.activationState == .foregroundActive})
//                    .map({$0 as? UIWindowScene})
//                    .compactMap({$0})
//                    .first?.windows
//                    .filter({$0.isKeyWindow}).first
//            keyWindow?.endEditing(true)
        }
        .onDisappear{
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            keyWindow?.endEditing(true)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
