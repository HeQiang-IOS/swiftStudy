import UIKit
/*
 闭包是自包含的函数代码块， 可以在代码中被传递和使用， Swift中的闭包与C和Objective-C中的代码块（blocks）以及其他一些编程语言中的匿名函数（Lambdas）比较相似
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。Swift会为你管理在捕获过程中涉及到的所有内存操作
 
闭包采用如下三种形式之一:
 1、全局函数是一个有名字但不会捕获任何值得闭包
 2、嵌套函数是一个有名字并可以捕获其封闭函数域内值得闭包
 3、闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值得匿名闭包
 
 Swift 的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：

 利用上下文推断参数和返回值类型
 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字
 参数名称缩写
 尾随闭包语法
 */

// 闭包表达式
// 排序方法
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
// 闭包表达式语法
/*
 {
 (parameters) -> return type in
   statements
 }
 */
reversedNames = names.sorted(by: { (s1:String, s2:String) -> Bool in
    return s1 > s2 })

// 根据上下文推断类型
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

// 单表达式闭包的隐式返回 单行表达式闭包可以通过省略return
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

// 参数名称缩写
reversedNames = names.sorted(by: {$0 > $1})

// 运算符方法
reversedNames = names.sorted(by: > )

// 尾随闭包
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以上是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

someFunctionThatTakesAClosure {
    
}

reversedNames = names.sorted(){ $0 > $1}
// 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
reversedNames = names.sorted {$0 > $1}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number)-> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


// 值捕获
/*
 闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
 */
func makeIncrementer(forIncrement amount: Int)-> () -> Int{
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

// 闭包是引用类型
/*
 上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。
 无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用。上面的例子中，指向闭包的引用 incrementByTen 是一个常量，而并非闭包内容本身。
 这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：
 */
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// 逃逸闭包
/*
 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
 */
var completionHandlers: [()->Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure:() -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

// 自动闭包
/*
 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
 @autoclosure 来接收一个自动闭包
 */
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())")
}

serve(customer: {customersInLine.remove(at: 0)})

func serve2(customer customerProvider: @autoclosure() -> String) {
    print("Now serving \(customerProvider())")
}
serve2(customer: customersInLine.remove(at: 0))

var customerProviders: [()-> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String)
{
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print(customerProviders.count)

for customerProvider in customerProviders {
    print(customerProvider())
}
