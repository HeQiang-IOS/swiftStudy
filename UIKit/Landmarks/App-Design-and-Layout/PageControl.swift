//
//  PageControl.swift
//  App-Design-and-Layout
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

import SwiftUI

import UIKit

struct PageControl: UIViewRepresentable {
    func makeCoordinator() -> PageControl.Coordinator {
        Coordinator(self)
    }
    
    
    typealias UIViewType = UIPageControl
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
  
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        return control
    }
    
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPage
    }
    
    
}


