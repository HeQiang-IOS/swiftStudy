//
//  ViewController.swift
//  观察者模式
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//
/*
 观察者模式（Observer Pattern）是一种设计模式，用来描述一对多关系：一个对象发生改变时将自动通知其他对象，其他对象将相应做出反应。这两类对象分别被称为被 观察目标（Observable）和 观察者（Observer），也就是说一个观察目标可以对应多个观察者，观察者可以订阅它们感兴趣的内容，当观察目标内容改变时，它会向这些观察者广播通知（调用 Observer 的更新方法）。有一点需要说明的是，观察者之间彼此时互相独立的，也并不知道对方的存在。
 */


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var observable = AnyObservable<AnyObserver<String>>("hello")
        
        let observer = AnyObserver<String>(name: "My Observer")
        
        observable.attach(observer: observer)
        
        observable.state = "world"
        // Do any additional setup after loading the view.
    }


}

protocol Observer {
    associatedtype State
    func notify(_ state: State)
}

protocol Observable {
    associatedtype T: Observer
    mutating func attach(observer: T)
}

struct AnyObservable<T: Observer>: Observable {
    var state: T.State {
        didSet {
            notifyStateChange()
        }
    }
    
    var observers: [T] = []
    
    init(_ state: T.State) {
        self.state = state
    }
    
    mutating func attach(observer: T) {
        observers.append(observer)
        observer.notify(state)
    }
    
    private func notifyStateChange() {
        for observer in observers {
            observer.notify(state)
        }
    }
}

struct AnyObserver<S>: Observer {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func notify(_ state: S) {
        print("\(name) is state updated to \(state)")
    }
}

