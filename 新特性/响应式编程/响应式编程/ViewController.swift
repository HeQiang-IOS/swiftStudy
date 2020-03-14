//
//  ViewController.swift
//  响应式编程
//
//  Created by 何强 on 2019/12/11.
//  Copyright © 2019 何强. All rights reserved.
//

/*
 响应式编程（Reactive Programming）是一种编程思想，相对应的也有面向过程编程、面向对象编程、函数式编程等等。不同的是，响应式编程的核心是面向异步数据流和变化的。

 在现在的前端世界中，我们需要处理大量的事件，既有用户的交互，也有不断的网络请求，还有来自系统或者框架的各种通知，因此也无可避免产生纷繁复杂的状态。使用响应式编程后，所有事件将成为异步的数据流，更加方便的是可以对这些数据流可以进行组合变换，最终我们只需要监听所关心的数据流的变化并做出响应即可。
 
 举个有趣的例子来解释一下：

 当你早上起床之后，你需要一边洗漱一边烤个面包，最后吃早饭。
 */

import UIKit

// 传统的编程方法：
/*
func goodMorning() {
    wake{
        let group = DispatchGroup()
        group.enter()
        
        wash {
            group.leave()
        }
        
        group.enter()
        
        cook {
            group.leave()
        }
        
        group.notify(queue: .main) {
            eat {
                print("Finished")
            }
        }
    }
}*/

// 响应式编程
/*
func reactiveGoodMorning() {
    let routine = wake.rx.flapLatest {
        return Observable.zip(wash, cook)
    }.flapLatest {
        return eat.rx
    }
    
    routine.subsrible(onCompleted: {
        print("Finished")
    })
 不同于传统可以看到 wake/wash/cook/eat 这几个事件通过一些组合转换被串联成一个流，我们也只需要订阅这个流就可以在应该响应的时候得到通知。
}*/








class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


