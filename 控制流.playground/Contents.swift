import UIKit

// For-in

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}

let numberOfLegs = ["spider": 0, "ant": 6, "cat":4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


let minutes = 60

for tickMark in 0..<minutes {
    print(tickMark)
}

let minuteInterval = 5
for tickMack in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMack)
}

let hours = 12
let hourInterval = 3
for tickMack in stride(from: 3, to: hours, by: hourInterval) {
    print(tickMack)
}
// While

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < diceRoll {
    diceRoll += 11
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game over")


repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
} while square < finalSquare
print("Game over")

// if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It is very cold, Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It is very cold, Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It is really warm, Do not forget to wear sunscreen")
}
else {
    print("It is not that cold, Wear a t-shirt")
}


// Switch

let someCharacter: Character = "z"

switch someCharacter {
case "a":
    print("This first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// 区间匹配
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings)")


let somePoint = (1, 1)
switch somePoint {
case (0, 0):
     print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside the box")
}
// 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
    
}

// where

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let(x, y) where x == -y:
     print("(\(x), \(y)) is on the line x == -y")
case let(x, y):
      print("(\(x), \(y)) is just some arbitrary point")
}

// 复合case
let someCharacter1: Character = "e"

switch someCharacter1 {
case "a", "e", "i", "o", "u":
   print("\(someCharacter1) is a vowel")
default:
   print("\(someCharacter1) is other")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) form the origin")
default:
    print("Not on an axis")
}

// 控制转移语句

// Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

// break
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// 贯穿（Fallthrough）
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3,  5, 7, 9:
    description += "a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

// 带标签的语句
/*
 可以使用标签来标记一个循环体或者条件语句，
 */

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

// 提前退出
/*
 像if语句一样， guard的执行取决于一个表达式的布尔值， 我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。 不同于if语句，一个guard语句总是有一个else从句，如果条件不为真则执行else从句中的代码
 */

func greet (person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you .")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}


greet(person: ["name": "John"])

greet(person: ["name": "Jane", "location": "Cupertino"])

// 检查API可用性
if #available(iOS 10, macOS 10.12, *){
} else{
}
