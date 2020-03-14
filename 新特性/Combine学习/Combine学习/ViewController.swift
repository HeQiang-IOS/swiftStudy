//
//  ViewController.swift
//  Combine学习
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//
/*
 Combine 可以使代码更加简洁、易于维护，也免除了饱受诟病的嵌套闭包和回调地狱。Combine 是 Reactive Programming 在 Swift 中的一个实现，更确切的说是对 ReactiveX (Reactive Extensions, 简称 Rx) 的实现，而这个实现正是基于观察者模式的。

 Combine 是基于泛型实现的，是类型安全的。它可以无缝地接入已有的工程，用来处理现有的 Target/Action、Notification、KVO、callback/closure 以及各种异步网络请求。
 
 在 Combine 中，有几个重要的组成部分：
    发布者： Publiser
    订阅者： Subscriber
    操作者： Operator
 */

import UIKit

import Combine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let student = Student(name: "Jack", score: 90)
        
        print(student.score)
        
        let observer = Subscribers.Assign(object: student, keyPath: \Student.score)
        let publisher = PassthroughSubject<Int, Never>()
        publisher.subscribe(observer)
        publisher.send(91)
        print(student.score)
        publisher.send(100)
        print(student.score)
        
    }


}

//class StudentManager {
//
//    let namePublisher: AnyPublisher<[String, Never]>
//
//    func updateStudentsFromLocal() {
//        let namePublisher: AnyPublisher<[String, Never]> = Publishers.Sequence<[Student], Never>(sequence: students).map { $0.name }.eraseToAnyPublisher()
//        self.namePublisher = namePublisher
//    }
//
//    func updateStudentsFromNetwork() {
//        let namePublisher: AnyPublisher<[String, Never]> = Publishers.Future { promise in
//            promise(.success([names]))
//        }.eraseToAnyPublisher()
//        self.namePublisher = namePublisher
//    }
//}

class Student {
    let name: String
    var score: Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
