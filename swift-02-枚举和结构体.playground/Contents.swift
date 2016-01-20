//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//使用 enum 来创建一个枚举。就像类和其他所有命名类型一样,枚举可以包含方法。
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    } }
let ace = Rank.Ace
let aceRawValue = ace.rawValue

//在上面的例子中,枚举原始值的类型是 Int ,所以你只需要设置第一个原始值。剩下的原始值会按照顺序赋 值。你也可以使用字符串或者浮点数作为枚举的原始值。使用 rawValue 属性来访问一个枚举成员的原始值。
//使用 init?(rawValue:) 初始化构造器在原始值和枚举值之间进行转换。
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
//枚举的成员值是实际值,并不是原始值的另一种表达方法。实际上,以防原始值没有意义,你不需要设置。
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    } }
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()


//注意,有两种方式可以引用 Hearts 成员:给 hearts 常量赋值时,枚举成员 Suit.Hearts 需要用全名来引用,因 为常量没有显式指定类型。在 switch 里,枚举成员使用缩写 .Hearts 来引用,因为 self 的值已经知道是一个 su it 。已知变量类型的情况下你可以使用缩写。
//使用 struct 来创建一个结构体。结构体和类有很多相同的地方,比如方法和构造器。它们之间最大的一个区别就 是结构体是传值,类是传引用。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//一个枚举成员的实例可以有实例值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值
//和原始值是不同的:枚举成员的原始值对于所有实例都是相同的,而且你是在定义枚举的时候设置原始值。
//例如,考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息。
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}

