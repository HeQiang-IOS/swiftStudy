//
//  WatchMapView.swift
//  WatchLandmarks Extension
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct WatchMapView: WKInterfaceObjectRepresentable {
    typealias WKInterfaceObjectType = WKInterfaceMap
    
    var landmark: Landmark
    
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WatchMapView.WKInterfaceObjectType {
        return WKInterfaceMap()
    }
    
    
    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
        
        wkInterfaceObject.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(landmark: UserData().landmarks[0])
    }
}
