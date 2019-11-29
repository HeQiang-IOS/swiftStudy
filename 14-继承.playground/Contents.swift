import UIKit
/*
 继承，一个类可以继承另一个类的方法，属性和其他特性。当一个类继承其他类时，继承类叫子类，被继承类叫超类（父类）,
 在Swift中，继承是区分「类」与其它类型的一个基本特征
 
 定义一个基类
 Swift中的类并不是从一个通用的基类继承而来的。如果你不为自己定义的类指定一个超类的话，这个类就会自动成为基类
 
 子类生成
 重写 override
 
 访问超类的方法、属性及下标
 
 重写方法
 重写属性
 重写属性观察器
 防止重写 final（final var、final func、fianl class func、 final subscript）
 防止继承 final class
*/

class Vehicle {
    var currentSpeed = 0.0
    final var hqValue = 1
    var description: String{ // getter
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandom = Tandem()
tandom.hasBasket = true
tandom.currentNumberOfPassengers = 2
tandom.currentSpeed = 22.0
print("Tandem: \(tandom.description)")

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car{
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
