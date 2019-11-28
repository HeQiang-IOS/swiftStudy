import UIKit

var str = "Hello, playground"
/*
 Swift提供Arrays、Sets 和 Dictionaries三种基本的集合类型用来存储集合数据。
 Swift语言中的Arrays、Sets和Dictionaries中存储的数据值类型必须明确。
 */

// Array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []

var threeeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList1 = ["Eggs" ,"Milk"]
var arr:[Any] = ["1", 2]
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"];
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Banans", "Apples"]
// 不可以用下标访问的形式去在数组尾部添加新项，

shoppingList.insert("Maple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)
firstItem = shoppingList[0]

let apples = shoppingList.removeLast();

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

// Sets
/*
 集合类型的哈希值，一个类型为了存储在集合中，该类型必须是可哈希化的----也就是说，该类型必须提供一个方法来计算它的哈希值，
 一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b，因此必须a.hashValue == b.hashValue.
 Swift的所有基本类型（比如String，Int、Double和Bool）默认都是可哈希化的，可以作为集合的值得类型或者字典的键的类型。没有关联值得枚举成员值默认也是可哈希化的。
 */

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

if favoriteGenres.isEmpty {
    print("As far as mucis goes , I am not picky.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre) ? I am over it")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It is too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["1", "2"];
let farmAnimals: Set = ["1", "2", "3", "4", "5"]
let cityAnimals: Set = ["6", "7"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

// 字典 注意： 一个字典的key类型必须遵循hashable协议， 就像Set的值类型
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports:[String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

var airports1 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The dictionary of airports contains \(airports.count) items. ")

if airports.isEmpty {
    print("The airports dictionary is empty. ")
} else {
    print("The airports dictionary is not empty. ")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue) .")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("The airport is not in the airports dictionary.")
}

airports["APL"] = "Apple Internation"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport is name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)


