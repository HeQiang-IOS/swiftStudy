//
//  ProfileHost.swift
//  App-Design-and-Layout
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var mode
    
    @EnvironmentObject var userData: UserData
    
    @State var draftProfile = Profile.default
    
    var body: some View {
//        Text("Profile for: \(draftProfile.username)")
        VStack(alignment: .leading, spacing: 20){
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
                
            }
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: draftProfile)
            } else {
//                Text("Profile Editor")
                ProfileEditor(profile: $draftProfile)
                
                    .onAppear{
                        self.draftProfile = self.userData.profile
                }
                .onDisappear{
                    self.userData.profile = self.draftProfile
                }
            }
            
        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
