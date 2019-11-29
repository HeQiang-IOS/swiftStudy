import UIKit
/**
 方法是与某些特定类型相关联的函数。 类，结构体，枚举都可以定义实例方法；
 结构体和枚举能够定义方法是Objective-C和Swift的主要区别之一。
 
 结构体和枚举是值类型，默认情况下，值类型的属性不能在它的实例方法中被修改， 但是，如果你确实需要在某个特定的方法中修改结构
 体或者枚举的属性，你可以为这个方法选择可变（mutating）行为，然后就可以从其方法内部改变它的属性；注意。不能在结构体的常量上调用可变方法，因为其属性不能被改变，即使属性是变量属性。
 */

class Counter{
    var count = 0
    func increment() {
        self.count += 1
    }
    func increment(by amount: Int){
        count += amount
    }
    
    func reset() {
        count = 0
    }
    
}

let counter = Counter()
counter.increment()

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRight(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRight(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 2.0)
print(somePoint2.x)

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: deltaX, y: deltaY)
    }
}


enum TriStateSwitch {
    case off, low, high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()


class SomeClass {
    class func someTypeMethod() {
        
    }
}

SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playName: String
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked ")
}


