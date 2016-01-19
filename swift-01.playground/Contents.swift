//: Playground - noun: a place where people can play

import UIKit
 /// var 修饰变量 let修饰常量
var str = "Hello, playground"
 /// 如果初始值没有提供足够的信息(或者没有初始值),那你需要在变量后面声明类型,用冒号分割。
let num:Float = 4
 /// 值不会隐式转换为其他类型，需要显示转换
let label = "this is a test project"
let width = 94
let labelWidth = label+String(width)
let labelHeight = label+String(width-4)
/**
*  把值转换成字符串的简便方法
*/
let text = "this is a text"
let length = 54
let textlength = text+"the length is \(length)"

/**
*  数组的创建
*/
var shoppingList = ["water","apple","orainge"]
shoppingList[1] = "appleWatch"
print(shoppingList)
 /// 创建空数组，如果类型不能够推断出来 则如下创建
var shopList = [String]()
/**
*  如果类型能够推断出来则如下创建方式
*/
shoppingList = []

/**
*  字典的创建
*/
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"


let occupation=[String:Float]()
occupations = [:]

var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "hello\(name)"
    
}
 /// 一个可选的值是一个具体的值或者 是 nil 以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
    
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

/// 可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话,可以使用默认值来代 替。
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"


/**
*
*使用 ..< 创建的范围不包含上界,如果想包含的话需要使用 ... 。
*/
var firstForLoop = 0
for i in 0..<4 {
firstForLoop += i
}
print(firstForLoop)
var secondForLoop = 0
for var i = 0; i < 4; ++i {
secondForLoop += i
}
print(secondForLoop)

