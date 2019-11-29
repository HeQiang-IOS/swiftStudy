import UIKit

/*
构造过程是使用类、结构体或枚举类型的实例之间的准备过程。
与Objective-C中构造器不同，Swift的构造器没有返回值。它们的主要任务是保证某种类型的新实例在第一次使用前完成正确的初始化
 
存储属性的初始赋值
  当你为存储型属性分配默认值或者在构造器中设置初始值时，它们的值是被直接设置的，不会触发任何属性观察者
 构造器init
 默认属性值
 自定义构造过程
  形参的构造过程
  形参命名和实参标签
  不带实参标签的构造形参
  可选属性类型
  构造过程中常量属性的赋值

 默认构造器
  结构体的逐一成员构造器
 值类型的构造器代理
 
 类的继承和构造过程
 指定构造器和便利构造器 init | convenience init
 
 可失败构造器
 
 必要构造器
 通过闭包或函数设置属性的默认值
 
 */

struct Fahrenheit {
    var temperature: Double = 20.0
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahreneheit: Double) {
        temperatureInCelsius = (fahreneheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahreneheit: Double) {
        temperatureInCelsius = (fahreneheit - 32.0) / 1.8
    }
       
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius2: Double) {
        temperatureInCelsius = celsius2
    }
}

let bodyTemperature = Celsius2(37.0)

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

class ShoppingListItem1{
    var name: String?
    var quantity = 1
    var purchased = false
}

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {
    }
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // supuer.init() 这里被隐式调用
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food();

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience  init(name: String) {
        self.init(name:name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name) "
        output += purchased ? "O" : "X"
        return output
    }
}


var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}


struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}


enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        default:
            return nil
        }
    }
}
let t = TemperatureUnit(symbol: "K")


enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let tt = TemperatureUnit2(rawValue: "K")

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}


class Document {
    var name: String?
    init() {
    }
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        /*
         通常来说我们通过在init关键字后添加问号的方法（init？）来定义一个可失败构造器。但你也可以通过在init后面添加感叹号的方式来定义一个可失败构造器（init！），该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象
         你可以在init？中代理到init！， 反之亦然， 你还可以用init代理到init！，不过，一旦init！构造失败，则会触发一个断言
         */
        super.init(name: "[Untitled]")! // init!可失败构造器
    }
}

class SomeClass {
    required init(){
        
    }
}
class SomeSubclass: SomeClass {
    required init() {
        
    }
}
/*
class SomeClass {
    let someProperty: SomeType = {
        在这个闭包中给 someProperty 创建一个默认值， someValue必须和SomeType 类型相同
        
        return someValue
    }()
}
 注意：闭包结尾的花括号后面接了一对空的小括号，这用来告诉Swift立即执行此闭包。 如果你忽略了这对括号，相当于将闭包本身作为赋值给了属性。而不是将闭包的返回值赋值给属性。
 
 如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其他部分都还没有初始化，这意味着你不能在闭包里访问其他属性，即使这些属性有默认值，同样，你也不能使用隐式的self属性，或者调用任何实例方法。
 
 */

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBook = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBook)
                isBook = !isBook
            }
            isBook = !isBook
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 1, column: 1))





