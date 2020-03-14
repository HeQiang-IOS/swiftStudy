//
//  TabBar.swift
//  UIDemo
//
//  Created by 何强 on 2019/12/17.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.yellow
    }
    
    @State var selectedView = 1
    
    var body: some View {
        TabView(selection: $selectedView) {
            Home().tabItem({
                Image("IconHome")
                Text("Home")
            })
            .tag(1)
            
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
                }).tag(2)
            
            Settings().tabItem({
                Image("IconSettings")
                Text("Settings")
                }).tag(3)
        }.accentColor(.red)
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension UINavigationController {
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        topViewController?.hidesBottomBarWhenPushed = true
    }
}
