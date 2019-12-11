//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct LandmarkList<DetailView: View>: View {
    
    //    @State var showFavoritesOnly = true
    @EnvironmentObject var userData: UserData
    
    let detailViewProducer: (Landmark) -> DetailView
    
    var body: some View {
        
        //        NavigationView {
        List {
            
            Toggle(isOn: $userData.showFavoritesOnly){
                Text("Favorites Only")
            }
            
            ForEach(userData.landmarks) { landmark in
                
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: self.detailViewProducer(landmark).environmentObject(self.userData)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
    //    }
}

#if os(watchOS)
typealias PreviewDetailView = WatchLandmarkDetail
#else
typealias PreviewDetailView = LandmarkDetail
#endif


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        LandmarkList {PreviewDetailView(landmark: $0)}.environmentObject(UserData())
        //        LandmarkList().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) {
//            deviceName in
//            LandmarkList().environmentObject(UserData()).previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
//        }
    }
}
