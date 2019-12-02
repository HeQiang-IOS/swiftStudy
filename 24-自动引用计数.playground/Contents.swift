import UIKit
/*
 自动引用计数
 注意： 引用计数仅仅应用于类的实例。结构体和枚举类型是值类型。不是引用类型，也不是通过引用的方式存储和传递
 解决实例之间的循环强引用：
    弱引用
    无主引用
       和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是。无主引用在其他实例有相同或者更长的生命周期时使用。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用
        无主引用通常都被期望拥有值。不过ARC无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil
      
        重点：
        使用无主引用，你必须确保引用始终指向一个未销毁的实例
        如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误

闭包的循环强引用
    Swift有如下要求：只要在闭包内使用self的成员，就要self.someProperty或者self.someMethod()（而不是someProperty或someMethod()）。这提醒你可能会不小心就捕获了self
 */

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = referencel
reference3 = referencel

reference1 = nil
reference2 = nil
reference3 = nil


class Person2 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var apartment: Apartment2?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment2 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john: Person2?
var unit4A: Apartment2?
john = Person2(name: "John Appleseed")
unit4A = Apartment2(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
john = nil
unit4A = nil

class Person3 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var apartment: Apartment3?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment3 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person3?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john3: Person3?
var unit4A3: Apartment3?

john3 = Person3(name: "John Appleseed")
unit4A3 = Apartment3(unit: "4A")

john3!.apartment = unit4A3
unit4A3!.tenant = john3
john3 = nil
unit4A3 = nil


class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var johnt: Customer?
johnt = Customer(name: "John Applessed")
johnt!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnt!)
johnt = nil


class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
}

lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!](index: Int, stringToProcess: String)-> String in
    // 这是是闭包的函数体
}

lazy var someClosure2: ()-> String ={
    [unowned self. weak delegate = self.delegate!] in
    // 这里是闭包的函数体
}

var country = Country(name: "Canade", capitalName: "Ottawa")
print(country.name)
print(country.capitalCity.name)


class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)> \(heading.text ?? defaultText) </\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil



