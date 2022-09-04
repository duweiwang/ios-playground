//
//  Codable.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//

import Foundation

struct Person: Codable {
    var firstName: String
    var lastName: String
    var nickname: String?
    
    // Since fullName is a computed property, it's excluded by default
    var fullName: String {
        return firstName + " " + lastName
    }

    // 只序列化2个字段
    private enum CodingKeys: String, CodingKey {
        case firstName, lastName, fullName
    }

    // We don't want to decode `fullName` from the JSON
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
    }

    // But we want to store `fullName` in the JSON anyhow
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(fullName, forKey: .fullName)
    }
}
