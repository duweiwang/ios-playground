//
//  ControlFlow.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/13.
//


// Swift 控制流

import Foundation




//For-in Loops

func forInLoop() {
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }
}


func loop2() {
    
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in numberOfLegs {
        print("\(animalName)s have \(legCount) legs")
    }
    
}


func rangLoop() {
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
}
