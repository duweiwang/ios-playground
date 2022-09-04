//
//  UserDefaultsDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/30.
//
// https://www.simpleswiftguide.com/how-to-use-userdefaults-in-swift/#:~:text=UserDefaults%20lets%20you%20store%20key,local%20plists%20file%20on%20disk.

import Foundation

///
/// Data
/// String
/// Number
/// Date
/// Array
/// Dictionary
///
///
class UserDefaultsDemo {
    let defaults = UserDefaults.standard

    func test() {
        defaults.set(22, forKey: "userAge")
        let userAge = defaults.integer(forKey: "userAge")

        var darkModeEnabled = true
        defaults.set(darkModeEnabled, forKey: "darkModeEnabled")
        let darkModeEnabled2 = defaults.bool(forKey: "darkModeEnabled")

        // array of strings
        let fruits = ["Apple", "Banana", "Mango"]
        defaults.set(fruits, forKey: "favoriteFruits")
        let favoriteFruits = defaults.array(forKey: "favoriteFruits")
        // default value
        let favoriteFruits2 = defaults.object(forKey: "favoriteFruits") as? [String] ?? [String]()

        let toggleStates = ["WiFi": true, "Bluetooth": false, "Cellular": true]
        defaults.set(toggleStates, forKey: "toggleStates")
        let toggleStates2 = defaults.dictionary(forKey: "toggleStates")

        /// 自定义数据类型
        let user = User(name: "Swift Guide", age: 22)

        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            defaults.set(encodedUser, forKey: "user")
        }

        if let savedUserData = defaults.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User.self, from: savedUserData) {
                print("Saved user: \(savedUser)")
            }
        }
    }

    struct User: Codable {
        let name: String
        let age: Int
    }
}
