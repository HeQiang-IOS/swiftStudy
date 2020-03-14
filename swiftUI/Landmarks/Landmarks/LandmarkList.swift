//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
//    @State var showFavoritesOnly = true
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        NavigationView {
            List {
                
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favorites Only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
            deviceName in
            LandmarkList().environmentObject(UserData()).previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
        }
    }
}
