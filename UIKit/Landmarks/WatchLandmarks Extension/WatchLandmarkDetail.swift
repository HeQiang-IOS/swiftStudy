//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    
    @EnvironmentObject var userData: UserData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id })!
    }
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                CircleImage(image: self.landmark.image.resizable()).scaledToFit()
                
                Text(self.landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                
                Toggle(isOn: $userData.landmarks[self.landmarkIndex].isFavorite){
                    Text("Favorite")
                }
                
                Divider()
                
                Text(self.landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(self.landmark.state)
                    .font(.caption)
                
                Divider()
                
                WatchMapView(landmark: self.landmark)
                .scaledToFit()
                .padding()
                
            }
        .padding(16)
        }
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let userData = UserData()
        return WatchLandmarkDetail(landmark: userData.landmarks[0]).environmentObject(userData)
    }
}
