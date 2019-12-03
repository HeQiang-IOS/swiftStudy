//
//  ViewController.swift
//  17-UIScrollerView
//
//  Created by 何强 on 2019/12/3.
//  Copyright © 2019 何强. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scorllView: UIScrollView = UIScrollView.init(frame: self.view.frame)
        self.view.addSubview(scorllView)
        
        let view: UIView = UIView.init(frame: .init(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .red
        scorllView.addSubview(view)
        
        scorllView.contentSize = CGSize.init(width: self.view.frame.size.width * 2, height: self.view.frame.size.height * 2)
        scorllView.bounces = false
        
        scorllView.scrollIndicatorInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        scorllView.showsHorizontalScrollIndicator = false
        
        scorllView.isPagingEnabled = true
        
        scorllView.minimumZoomScale = 0.5
        
        scorllView.maximumZoomScale = 2
        
        scorllView.delegate = self
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }

    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
}

