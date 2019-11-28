import UIKit

/*
 函数是一段完成特定任务的独立代码片段， 你可以通过给函数命名来标识某个函数的功能。这个名字可以被用来在需要的时候“调用”这个函数来完成它的任务
 */

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

func sayHelloWorld() -> String {
    return "hello world"
}
print(sayHelloWorld())


func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloWorld()
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

func greet2(person: String) {
    print("Hello, \(person)")
}


func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


// 函数参数标签和参数名称
func someFunction(argumentLabel parameterName: Int){
    
}

func greet3(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

print(greet3(person: "Bill", from: "Cupertino"))

func someFunction(_ firstParameterName: Int, secondParameterName: Int){
    
}
someFunction(1, secondParameterName: 2)

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12){
    
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5, 6)

// 输入输出参数 inout 一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原理的值， 注意， 输入输出参数不能有默认值，而且可变参数不能用inout标记。
func swapTwoTnts(_ a: inout Int, _ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoTnts(&someInt, &anotherInt)
print(someInt)

// 函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int)->Int = addTwoInts
print(mathFunction(2, 3))

func printMathResult(_ mathFunction:(Int, Int)-> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int{
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool)-> (Int)->Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue>0)
print(moveNearerToZero(currentValue))

func chooseStepFunction1(backward: Bool) -> (Int)->Int {
    func stepForward1(input: Int) -> Int {return input + 1}
    func stepBackward1(input: Int) -> Int {return input - 1}
    
    return backward ? stepBackward1 : stepForward1
}

var currentValue1 = 4
let moveNearerToZero1 = chooseStepFunction1(backward: currentValue1>0)
while currentValue1 != 0 {
    print("\(currentValue1)")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero! ")

