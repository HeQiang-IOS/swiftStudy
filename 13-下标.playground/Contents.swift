import UIKit
/*
 下标可以定义在类、结构体和枚举中，是访问集合、列表或序列中元素的快捷方式。可以使用下标的索引、设置和获取值。而不需要再调用对应的存取方法。
 一个类型可以定义多个下标，通过不同索引类型进行重载。下标不限于一维。你可以定义具有多个入参的下标满足自定义类型的需求。
 
 下标语法：
 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。 使用subscript关键字
 
 下标用法：
 取决于使用场景，下标通常作为访问集合、列表或序列中元素的快捷方式
 
 下标选项：
 下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和b可变参数。但不能使用输入输出参数。也不能给参数设置默认值

subscript(index: Int)-> Int {
    get{
        
    }
    set(newValue){
        
    }
}

subscript(index: Int)-> Int {
    
}
  */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) ->Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable)")


var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4];
numberOfLegs["bird"] = 2

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

let someValue = matrix[2, 2]
