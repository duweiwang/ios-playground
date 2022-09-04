//
//  Dictionary.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//

import Foundation

var dict1: [Int: String] = [1: "One", 2: "Two", 3: "Three"]
var dict2: [String: String] = ["1": "One", "2": "Two", "3": "Three"]
var dict3: [String: String] = ["1": "One", "2": "Two", "3": "Three"]

func forLoop() {
    // key
    for key in dict1.keys {
        print(key)
    }

    // value
    for value in dict1.values {
        print(value)
    }

    // key-value
    for (key, value) in dict1 {
        print(key, value)
    }

    // enumerated
    for (key, value) in dict1.enumerated() {
        print(key, value)
    }
}
