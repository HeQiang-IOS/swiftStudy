import UIKit
/**
 Swift中结构体和类有很多共同点， 两者都可以：
 1、定义属性用于存储值
 2、定义方法用于提供功能
 3、定义下标操作用于通过下标语法访问它们的值
 4、定义构造器用于设置初始值
 5、通过扩展以增加默认实现之外的功能
 6、遵循协议以提供某种标准功能
 与结构体相比， 类还有如下的功能：
 1、继承，允许一个类继承另一个类的特征
 2、类型转换允许在运行时检查和解释一个类实例的类型
 3、析构器允许一个类实例释放任何其所被分配的资源
 4、引用计数允许对一个类的多次引用
 
 类支持的附加功能是以增加复杂性为代价的，作为一般准则，优先使用结构体，因为它们更容易理解，仅在适当或必要时才使用类。
 
所有结构体都有一个自动生成的成员逐一构造器。用于初始化新结构体实例中成员的属性。与结构体不同，类实例没有默认的成员逐一构造器
 
 结构体和枚举是值类型
 值类型是这样一种类型，当它被赋值给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。

 
 标准库定义的集合，例如数组、字典和字符串。都对复制进行了优化以降低性能成本。新集合不会立即复制，而是跟原集合共享同一份内存，共享同样的元素。在集合的某个副本要被修改前，才会复制a它的元素，而你在代码中看起来就像是立即发生了复制
 
 类是引用类型
 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。以此，使用的是已存在实例的引用，而不是其拷贝
 
 恒等运算符 ===-（相同） ==（等于）， ”相同“表示两个类类型的常量或者变量引用同一个类实例， ”等于“表示两个实例的值相等或等价
 */


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.height)")
someVideoMode.resolution.width = 1280
let vge = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print(cinema.width)

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()
print(currentDirection)
print(rememberedDirection)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance. ")
}
