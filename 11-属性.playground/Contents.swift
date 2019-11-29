import UIKit
/*
 属性：将值与特定的类、结构体或枚举关联。存储属性会将常量和变量存储为实例的一部分，而计算属性则是直接计算（而不是存储）值。
 计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
 
 存储属性和计算属性通常与特定类型的实例关联，但是属性也可以直接与类型本身关联，这种属性称为类型属性。
 
 另外， 还可以定义属性观察器来监控属性值得变化，以此来触发自定义的操作。属性观察器可以添加到类本身定义的存储属性上，也可以添加到从父类继承的属性上
 
 延时加载存储属性 lazy 指当第一次被调用的时候才会计算其初始值得属性。 必须将延时加载属性声明成变量（var），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须有有初始值，因此无法声明成延时加载。
 
 
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.fileName)

struct Point{
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set (newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print(square.origin.x)

class AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y:centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) { // 默认newValue
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("增加了 \(totalSteps - oldValue)步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360


struct SomeStructure {
    static var storedTypeProperty = "some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

struct SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    } // 只读
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

SomeStructure.storedTypeProperty = "2"
SomeStructure.computedTypeProperty // 只读
SomeClass.computedTypeProperty
SomeClass.storedTypeProperty = "1"



struct Audiochannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > Audiochannel.thresholdLevel {
                currentLevel = Audiochannel.thresholdLevel
            }
            if currentLevel > Audiochannel.maxInputLevelForAllChannels {
                Audiochannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = Audiochannel()
var rightChannel = Audiochannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(Audiochannel.maxInputLevelForAllChannels)
