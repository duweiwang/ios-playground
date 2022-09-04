//
//  ErrorHandle.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//
//
// 异常处理
//
//

import Foundation

enum SomeError: Error {
    case error1
    case error2
    case error3
}

func throwErrors(type: Int) throws -> String {
    if type == 1 {
        throw SomeError.error1
    }

    if type == 2 {
        throw SomeError.error2
    }

    return "success"
}

func catchError() {
    do {
        let result = try throwErrors(type: 1)
        print(result)
    } catch {
        print("catch a error")
    }
}

func unHandleError() {
    let result = try? throwErrors(type: 1)

    if result == nil {
        print("error")
    }
}
