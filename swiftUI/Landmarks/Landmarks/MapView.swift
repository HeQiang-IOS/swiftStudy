//
//  MapView.swift
//  Landmarks
//
//  Created by 何强 on 2019/12/10.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MapView.UIViewType {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MapView.UIViewType, context: UIViewRepresentableContext<MapView>) {
//        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
