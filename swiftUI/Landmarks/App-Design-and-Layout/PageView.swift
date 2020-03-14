//
//  PageView.swift
//  App-Design-and-Layout
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 0
    
    
    init(_ views: [Page]) {
        self.viewControllers = views.map{
            UIHostingController(rootView: $0)
        }
    }
    
    
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(currentPage: $currentPage, controllers: viewControllers)
            
//            Text("Current Page: \(currentPage)")
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage).padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(features.map{ FeatureCard(landmark: $0)}).aspectRatio(3/2, contentMode: .fit)
        
    }
}
