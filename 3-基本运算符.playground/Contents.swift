import UIKit

/*
 运算符是检查、改变、合并值得特殊符号或短语
 术语：
 运算符分为一元、二元、三元运算符
 1、一元运算符对单一操作对象操作（如--a），分前置运算符（--a）和后置运算符（a--）
 2、二元运算符操作两个操作对象（如2 + 3）
 3、三元运算符操作三个操作对象，Swift中只有一个三元运算符， 就是三目运算符（a？b:c）
 受运算符影响的值叫做操作数， 在表达式 1 + 2 中， 加号+ 是二元运算符， 它的两个操作数的值1和2
 */

// 赋值运算符
let b = 10
var a = 5
a = b
let (x, y) = (1, 2)

/*
 与C语言和Objective-C不同， Swift的赋值操作并不会返回任何值。 所以下面语句是无效的：
 if x = y {
 此句错误， x = y 并不返回任何值
 }
 */

// 算术运算符

1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello" + "world"

// 求余运算符
9 % 4

// 一元负号运算符
let three = 3
let minusThree = -three
let plusThree = -minusThree

// 一元正号运算符
let minusSix = -6
let alsoMinusSix = -minusSix

// 组合赋值运算符, 复合赋值运算没有返回值，let b = a += 2 这类代码是错误的。
var a1 = 1
a1 += 2

// 比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I am sorry \(name), but I do not recognize you")
}

// 如果两个元组的元素相同，且长度相同的话，元组就可以被比较，比较元组大小会按照从左到右，逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。 存在布尔类型的元组不能被比较


(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
// Swift标准库只能比较七个以内元素的元组比较函数，如果你的元组元素超过七个时，你需要自己实现比较运算符

// 三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let contentHeight1 = 40
let hasHeader1 = true
var rowHeight1 = contentHeight
if hasHeader1 {
    rowHeight1 = rowHeight1 + 50
} else {
    rowHeight1 = rowHeight1 + 20
}

// 空合运算符（a ？？ b）
//a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

// 区间运算符
// 闭区间运算
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

// 半开区间运算符
let names = ["Annal", "Alex", "Brian", "Jack"]
let count = names.count;

for i in 0..<count {
    print("第 \(i+1) 个人叫\(names[i])")
}

// 单侧区间
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

// 逻辑运算符
// 逻辑非运算符
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// 逻辑与运算符
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 逻辑或运算符
let hasDorrKey = false
let knowsOverridePassword = true
if hasDorrKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

// 逻辑运算符组合计算
if (enteredDoorCode && passedRetinaScan) || hasDorrKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}







