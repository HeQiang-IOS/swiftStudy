//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList{WatchLandmarkDetail(landmark: $0)}.environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList {WatchLandmarkDetail(landmark: $0)}.environmentObject(UserData())
    }
}
