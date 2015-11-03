//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"



class MakeSth {
    required init() {
    }
    
    func call(value: Int) {
        println(value)
    }
    
    static func call(value: Int) {
        self().call(value)
    }
}

MakeSth.call(1)
