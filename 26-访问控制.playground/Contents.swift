import UIKit
/*
var str = "Hello, playground"
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

class SomeInternalClass2 {}   // 隐式 internal
var someInternalConstan2t = 0 // 隐式 internal


public class SomePublicClass {                  // 显式 public 类
    public var somePublicProperty = 0            // 显式 public 类成员
    var someInternalProperty = 0                 // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

class SomeInternalClass {                       // 隐式 internal 类
    var someInternalProperty = 0                 // 隐式 internal 类成员
    fileprivate func someFilePrivateMethod() {}  // 显式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

fileprivate class SomeFilePrivateClass {        // 显式 fileprivate 类
    func someFilePrivateMethod() {}              // 隐式 fileprivate 类成员
    private func somePrivateMethod() {}          // 显式 private 类成员
}

private class SomePrivateClass {                // 显式 private 类
    func somePrivateMethod() {}                  // 隐式 private 类成员
}
 自定义类型
 如果想为一个自定义类型指定访问级别，在定义类型时进行指定即可。新类型只能在它的访问级别限制范围内使用。例如，你定义了一个 fileprivate 级别的类，那这个类就只能在定义它的源文件中使用，可以作为属性类型、函数参数类型或者返回类型，等等。
 
 元组类型
 元组的访问级别将由元组中访问级别最严格的类型来决定。例如，如果你构建了一个包含两种不同类型的元组，其中一个类型为 internal，另一个类型为 private，那么这个元组的访问级别为 private。
 
 函数类型
 函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。
 
 枚举类型
 枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。

 比如下面的例子，枚举 CompassPoint 被明确指定为 public，那么它的成员 North、South、East、West 的访问级别同样也是 public：
 
 嵌套类型
 如果在 private 的类型中定义嵌套类型，那么该嵌套类型就自动拥有 private 访问级别。如果在 public 或者 internal 级别的类型中定义嵌套类型，那么该嵌套类型自动拥有 internal 访问级别。如果想让嵌套类型拥有 public 访问级别，那么需要明确指定该嵌套类型的访问级别。

 子类
 子类的访问级别不得高于父类的访问级别。例如，父类的访问级别是 internal，子类的访问级别就不能是 public。

 此外，你可以在符合当前访问级别的条件下重写任意类成员（方法、属性、构造器、下标等）。
 
 常量、变量、属性、下标
 常量、变量、属性不能拥有比它们的类型更高的访问级别。例如，你不能定义一个 public 级别的属性，但是它的类型却是 private 级别的。同样，下标也不能拥有比索引类型或返回类型更高的访问级别。
 
 
 构造器
 自定义构造器的访问级别可以低于或等于其所属类型的访问级别。唯一的例外是必要构造器，它的访问级别必须和所属类型的访问级别相同。

 如同函数或方法的参数，构造器参数的访问级别也不能低于构造器本身的访问级别。

 默认构造器
 如默认构造器所述，Swift 会为结构体和类提供一个默认的无参数的构造器，只要它们为所有存储型属性设置了默认初始值，并且未提供自定义的构造器。

 默认构造器的访问级别与所属类型的访问级别相同，除非类型的访问级别是 public。如果一个类型被指定为 public 级别，那么默认构造器的访问级别将为 internal。如果你希望一个 public 级别的类型也能在其他模块中使用这种无参数的默认构造器，你只能自己提供一个 public 访问级别的无参数构造器。

 结构体默认的成员逐一构造器
 如果结构体中任意存储型属性的访问级别为 private，那么该结构体默认的成员逐一构造器的访问级别就是 private。否则，这种构造器的访问级别依然是 internal。

 如同前面提到的默认构造器，如果你希望一个 public 级别的结构体也能在其他模块中使用其默认的成员逐一构造器，你依然只能自己提供一个 public 访问级别的成员逐一构造器。

 协议
 如果想为一个协议类型明确地指定访问级别，在定义协议时指定即可。这将限制该协议只能在适当的访问级别范围内被遵循。

 协议中的每一个要求都具有和该协议相同的访问级别。你不能将协议中的要求设置为其他访问级别。这样才能确保该协议的所有要求对于任意遵循者都将可用。
 
 协议继承
 如果定义了一个继承自其他协议的新协议，那么新协议拥有的访问级别最高也只能和被继承协议的访问级别相同。例如，你不能将继承自 internal 协议的新协议定义为 public 协议。

 协议遵循
 一个类型可以遵循比它级别更低的协议。例如，你可以定义一个 public 级别类型，它能在别的模块中使用，但是如果它遵循一个 internal 协议，这个遵循的部分就只能在这个 internal 协议所在的模块中使用。

 遵循协议时的上下文级别是类型和协议中级别最小的那个。如果一个类型是 public 级别，但它要遵循的协议是 internal 级别，那么这个类型对该协议的遵循上下文就是 internal 级别。
 
 Extension
 Extension 可以在访问级别允许的情况下对类、结构体、枚举进行扩展。Extension 的成员具有和原始类型成员一致的访问级别。例如，你使用 extension 扩展了一个 public 或者 internal 类型，extension 中的成员就默认使用 internal 访问级别，和原始类型中的成员一致。如果你使用 extension 扩展了一个 private 类型，则 extension 的成员默认使用 private 访问级别。

 或者，你可以明确指定 extension 的访问级别（例如，private extension），从而给该 extension 中的所有成员指定一个新的默认访问级别。这个新的默认访问级别仍然可以被单独指定的访问级别所覆盖
 
 泛型
 泛型类型或泛型函数的访问级别取决于泛型类型或泛型函数本身的访问级别，还需结合类型参数的类型约束的访问级别，根据这些访问级别中的最低访问级别来确定。

 类型别名
 你定义的任何类型别名都会被当作不同的类型，以便于进行访问控制。类型别名的访问级别不可高于其表示的类型的访问级别。例如，private 级别的类型别名可以作为 private、file-private、internal、public 或者 open 类型的别名，但是 public 级别的类型别名只能作为 public 类型的别名，不能作为 internal、file-private 或 private 类型的别名。
*/
