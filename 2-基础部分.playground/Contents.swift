import UIKit
// Swift 比OC多元组、可选类型、 类型安全和类型推断的语言
// 常量和变量
let maximunNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0

// 类型标注
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

// 常量和变量的命名
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
// 输出常量和变量
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

// 这是一个注释
/*
 这也是一个注释
 但是是多行的
 */

// 分号;
let cat="cat"; print(cat)

// 整数 0 255
let minValue = UInt8.min
let maxValue = UInt8.max

// Int 在32位平台上 Int和Int32长度相同， 在64位平台上， Int和Int64长度相同
// UInt 在32位平台上 UInt和UInt32长度相同， 在64位平台上， UInt和UInt64长度相同

// 浮点数 Double表示64位浮点数，精确度很高，至少有15位数字； Float表示32位浮点数，只有6位数字

// 类型安全和类型推断
// 由于Swift是类型安全的，所以它会在编译你的代码时进行类型检查。并把不匹配的类型标记为错误。这可以让你在开发的时候尽早发现并修复错误。
/*
 一个十进制数， 没有前缀
 一个二进制数， 前缀是0b
 一个八进制数， 前缀是0o
 一个十六进制数， 前缀是0x
 */

let deciamlInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

// 整数转换
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// 布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let i = 1
if i == 1 {
}

// 元组 把多个值组合成一个复合值，元组内的值可以是任意类型，并不要求是相同类型

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
print("The status code is \(http200Status.0)")

// 可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
// Swift的nil和Objective-C中的nil并不一样。在Objective-C中，nil是一个指向不存在对象的指针，在Swift中，nil不是指针----它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。


// if语句以及强制解析

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
    // 使用！来获取一个不存在的可选值会导致运行时错误。使用！来强制解析值之前，一定要确定可选包含一个非nil的值
}

// 可选绑定
/*
 使用可选绑定（optional binding）来判断可选类型是否包含值
 如果包含就把值赋给一个临时常量或者变量，可选绑定可以用if和while语句中，
 这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个
 常量或者变量。
 */

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// 隐式解析可选类型 把想要用作可选的类型的后面的问号（String?）改为感叹号(String!)来声明一个隐式解析可选类型
// 隐式解析可选类型主要被用在 Swift 中类的构造过程中
let possibleString: String? = "An optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String =  assumedString


if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

// 错误处理
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
} catch {
    
}

func makeASandwich() throws {
    
}

// 断言和先决条件
/*
 断言和先决条件是在运行时所做的检查。你可以用他们来检查在执行后续代码之前是否一个必要的条件已经被满足了。如果断言或者先决条件中的布尔条件评估的结果为 true（真），则代码像往常一样继续执行。如果布尔条件评估结果为 false（假），程序的当前状态是无效的，则代码执行结束，应用程序中止。
 你使用断言和先决条件来表达你所做的假设和你在编码时候的期望。你可以将这些包含在你的代码中。断言帮助你在开发阶段找到错误和不正确的假设，先决条件帮助你在生产环境中探测到存在的问题。
 
 断言和先决条件的不同点是，他们什么时候进行状态检测：断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。在生产环境中，断言的条件将不会进行评估。这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。
 */


let age = -3
assert(age >= 0, "A person is age cannot be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel")
} else if age > 0 {
    print("You can ride the ferris wheel")
} else {
    assertionFailure("A person is age can not be less than zero.")
}


precondition(age>10, "A person")
