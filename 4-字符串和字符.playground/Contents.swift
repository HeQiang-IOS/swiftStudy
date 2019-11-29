import UIKit

var str = "Hello, playground"
// 字符串字面量, 字符串字面量可以用于为常量和变量提供初始值
let someString = "Some string literal value"

// 多行字符串字面量
let quotaion = """

The White Rabbit,\
please your Majesty

"""

// 字符串字面量的特殊字符 空字符\0 反斜线\\

// 扩展字符串分隔符
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes:"""
"""#

// 初始化空字符串
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
print("Nothing to see here")
}

// 字符串可变性
var variableString = "Horse"
variableString += "and carriage"

// 字符串的值类型 在Swift中String类型的值类型。
// 使用字符
for character in "Dog!" {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)


// 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2


var instruction = "look over"
instruction += string2

let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

// 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Unicode
let eAcute: Character = "\u{E9}"

// 计算字符数量
let unnsualMenagerie = "Koala, Snail, Penguin, Dromedary"
print("unnsualMenagerie has \(unnsualMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)") // 4
word += "\u{301}" // 拼接一个重音
print("the number of characters in \(word) is \(word.count)") // 4

// 访问和修改字符串
// 字符串索引
// 由于不同的字符可能占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个Unicode标量直到结尾，因此，Swift的字符串不能用整数（integer）做索引

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
//greeting[greeting.endIndex] 使用endIndex属性可以获取最后一个Character的后一个位置的索引，因此，endIndex属性不能作为一个字符串的有效下标
greeting[greeting.index(after: greeting.startIndex)]
greeting[greeting.index(before: greeting.endIndex)]
let inde = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[inde]

for index in greeting.indices {
    print("\(greeting[index])", terminator:"")
}

// 插入和删除
var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)

welcome1.insert(contentsOf:" there", at: welcome1.index(before: welcome1.endIndex))

welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex

welcome1.removeSubrange(range)

// 子字符串
let greeting1 = "Hello, world!"
let index = greeting1.firstIndex(of: ",") ?? greeting1.endIndex;
let beginning = greeting1[..<index]
let newString = String(beginning)

// 比较字符串
// 字符串、字符相等

let quotation = "We are a lot alike, you and I"
let sameQuotation = "We are a lot alike, you and I"

if quotation == sameQuotation {
    print("There two strings are considered equal")
}

// 前缀、后缀相等
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// 字符串的Unicode表示形式 unicode 统一字符编码
let dogString = "Dog!"

for codeUnit in dogString.utf8 {
    print(codeUnit)
}

for codeUnit in dogString.utf16 {
    print(codeUnit)
}


for scalar in dogString.unicodeScalars {
    print(scalar)
    print(scalar.value)
}






