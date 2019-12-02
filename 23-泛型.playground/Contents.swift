import UIKit

/*
 泛型代码让你能根据自定义的需求，编写出适用于任意类型的、灵活可复用的函数及类型。你可避免编写重复的代码，用一种清晰抽象的方式来表达代码的意图
 泛型解决的问题 T占位符 T U V
 泛型函数
 泛型参数
 命名类型参数
 泛型类型
 泛型扩展
 类型约束
    类型约束语法
 关联类型
    关联类型
    扩展现有类型来指定关联类型
    给关联类型约束里使用协议
 泛型Where语句
 具有泛型Where子句的扩展
 具有泛型Where子句的关联类型
 泛型下标
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    b = a
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")


struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("nuo")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem) .")
}

/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U){
    // 这里是泛型函数的函数体部分
}
*/

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

/*
 Swift标准库定义了一个Equatable协议， 该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符（!=）,
 从而能对该类型的任意两个值进行比较。所有的Swift标准类型自动支持Equatable协议
 */
func findIndex2<T: Equatable>(of valueToFinde: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFinde {
            return index
        }
    }
    return nil
}

let doubleInt = findIndex2(of: 9.3, in: [3.14159, 0.1, 0.23])
let stringIndex = findIndex2(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

/*
 定义一个协议时，声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位符名称。
 其代表的实际类型在协议被遵循时才会被指定，关联类型通过associatedtype关键字来指定, typealias
 */

protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item{get}
}
extension Array: Container{}

struct IntStack2: Container {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() ->Int {
        return items.removeLast()
    }
    
    // Container 协议的实现部分
    typealias Item = Int
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int{
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack2<Element:Equatable>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() ->Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}




extension Stack2: SuffixableContainer {
    func suffix(_ size: Int) -> Stack2 {
        var result = Stack2()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

var stackOfInts = Stack2<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(50)
let suffix = stackOfInts.suffix(2)

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfString2s = Stack2<String>()
stackOfString2s.push("uno")
stackOfString2s.push("dos")
stackOfString2s.push("tres")



var arrayOfStrings = ["uno", "dos", "tres"]
if allItemsMatch(stackOfString2s, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match")
}

extension Stack2 where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}


if stackOfString2s.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}


struct NotEquatalbe {}

var notEquatableStack = Stack2<NotEquatalbe>()
let notEquatableValue = NotEquatalbe()

notEquatableStack.push(notEquatableValue)
notEquatableStack.isTop(notEquatableValue)

extension Container where Item: Equatable {
    func startsWith (_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}
if [9, 9, 9].startsWith(42) {
    print("Starts with 42.")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        
        return sum / Double(count)
    }
}

print([1260.0, 1200.0, 98.6, 37.0].average())

protocol Container3 {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int{get}
    subscript(i: Int) -> Item {get}
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

protocol comparableContainer: Container3 where Item: Comparable{
}

extension Container3 {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in Indices {
            result.append(self[index])
        }
        return result
    }
}


