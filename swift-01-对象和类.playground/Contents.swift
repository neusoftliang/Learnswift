
//使用 class 和类名来创建一个类。类中属性的声明和常量、变量声明一样,唯一的区别就是它们的上下文是 类。同样,方法和函数声明也一样。
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//类的创建要用class + 函数名来进行创建 init是构造函数 self区别实例变量和传过来的参数，相当于java中的this 和ios中的self有一定区别；注意 self 被用来区别实例变量。当你创建实例的时候,像传入函数参数一样给类传入构造器的参数。每个属性都 需要赋值——无论是通过声明(就像 numberOfSides )还是通过构造器(就像 name )。如果你需要在删除对象之前进行一些清理工作,使用 deinit 创建一个析构函数。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//要创建一个类的实例,在类名后面加上括号。使用点语法来访问实例的属性和方法。
var nameShape = NamedShape(name: "circle")
nameShape.numberOfSides = 1
nameShape.simpleDescription()
//子类如果要重写父类的方法的话,需要用 override 标记——如果没有添加 override 就重写父类方法的话编译器 会报错。编译器同样会检测 override 标记的方法是否确实在父类中。
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() ->  Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    } }
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class Circle :NamedShape {
    var radius : Double = 0
    var circle_name : String = ""
    init(radius:Double,circle_name:String)
    {
        super.init(name: circle_name)
        self.radius = radius
        self.circle_name = circle_name
    }
    func area()->Double
    {
        return 3.14*radius*radius
    }
    override func simpleDescription() -> String {
         return "A circle with radius of length \(radius)."
    }
    
    
    
    
}

var circle = Circle(radius: 23.5, circle_name:"circle")
circle.area()
circle.simpleDescription()




//除了储存简单的属性之外,属性可以有 getter 和 setter 。
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        } }
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    } }
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
/*在 perimeter 的 setter 中,新值的名字是 newValue 。你可以在 set 之后显式的设置一个名字。 注意 EquilateralTriangle 类的构造器执行了三步:
1. 设置子类声明的属性值
2. 调用父类的构造器
3. 改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
如果你不需要计算属性,但是仍然需要在设置一个新值之前或者之后运行代码,使用 willSet 和 didSet 。 比如,下面的类确保三角形的边长总是和正方形的边长相同。*/
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        } }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//处理变量的可选值时,你可以在操作(比如方法、属性和子脚本)之前加 ? 。如果 ? 之前的值是 nil , ? 后面 的东西都会被忽略,并且整个表达式返回 nil 。否则, ? 之后的东西都会被运行。在这两种情况下,整个表达式 的值也是一个可选值。
var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//optionalSquare = nil
let sideLength = optionalSquare?.sideLength
