import UIKit
/*
 内存安全
     默认情况下，Swift 会阻止你代码里不安全的行为。例如，Swift 会保证变量在使用之前就完成初始化，在内存被回收之后就无法被访问，并且数组的索引会做越界检查。
 
 理解内存访问冲突
     内存的访问，会发生在你给变量赋值，或者传递参数给函数时
     内存访问的冲突会发生在你的代码尝试同时访问同一个存储地址的时侯。同一个存储地址的多个访问同时发生会造成不可预计或不一致的行为。在 Swift 里，有很多修改值的行为都会持续好几行代码，在修改值的过程中进行访问是有可能发生的。
 
 内存访问性质
     内存访问冲突时，要考虑内存访问上下文中的这三个性质：访问是读还是写，访问的时长，以及被访问的存储地址。特别是，冲突会发生在当你有两个访问符合下列的情况：
     至少有一个是写访问
     它们访问的是同一个存储地址
     它们的访问在时间线上部分重叠
 然而，有几种被称为长期访问的内存访问方式，会在别的代码执行时持续进行。瞬时访问和长期访问的区别在于别的代码有没有可能在访问期间同时访问，也就是在时间线上的重叠。一个长期访问可以被别的长期访问或瞬时访问重叠。
 重叠的访问主要出现在使用 in-out 参数的函数和方法或者结构体的 mutating 方法里。Swift 代码里典型的长期访问会在后面进行讨论。
 
 In-Out参数的访问冲突
 
 长期访问的存在会造成一个结果，你不能在访问以 in-out 形式传入后的原变量，即使作用域原则和访问权限允许——任何访问原变量的行为都会造成冲突。例如：
 长期写访问的存在还会造成另一种结果，往同一个函数的多个 in-out 参数里传入同一个变量也会产生冲突，例如：
 
 方法里self的访问冲突
      一个结构体的 mutating 方法会在调用期间对 self 进行写访问。
 
 属性的访问冲突
    如结构体，元组和枚举的类型都是由多个独立的值组成的，例如结构体的属性或元组的元素。因为它们都是值类型，修改值的任何一部分都是对于整个值的修改，意味着其中一个属性的读或写访问都需要访问整一个值。
 在实践中，大多数对于结构体属性的访问都会安全的重叠。例如，将上面例子里的变量 holly 改为本地变量而非全局变量，编译器就会可以保证这个重叠访问是安全的：
 
 限制结构体属性的重叠访问对于保证内存安全不是必要的。保证内存安全是必要的，但因为访问独占权的要求比内存安全还要更严格——意味着即使有些代码违反了访问独占权的原则，也是内存安全的，所以如果编译器可以保证这种非专属的访问是安全的，那 Swift 就会允许这种行为的代码运行。特别是当你遵循下面的原则时，它可以保证结构体属性的重叠访问是安全的：

 你访问的是实例的存储属性，而不是计算属性或类的属性
 结构体是本地变量的值，而非全局变量
 结构体要么没有被闭包捕获，要么只被非逃逸闭包捕获了
 
 */
func oneMore(than number: Int) -> Int {
    return number + 1
}
var myNubmer = 1
myNubmer = oneMore(than: myNubmer)
print(myNubmer)

var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
// 错误：stepSize 访问冲突 increment(&stepSize)
// 解决这个冲突的一种方式，是显示拷贝一份 stepSize ：
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)  // 正常
// 错误：playerOneScore 访问冲突 balance(&playerOneScore, &playerOneScore)

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player){
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)  // 正常
// 错误：oscar 访问冲突 oscar.shareHealth(with: &oscar) 在方法里，self 和 teammate 都指向了同一个存储地址——就像下面展示的那样。对于同一块内存同时进行两个写访问，并且它们重叠了，就此产生了冲突。

// 错误：playerInformation 的属性访问冲突
//var playerInformation = (health: 10, energy: 20) 元组
//balance(&playerInformation.health, &playerInformation.energy)

//var holly = Player(name: "Holly", health: 10, energy: 10)
//balance(&holly.health, &holly.energy)

func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}


