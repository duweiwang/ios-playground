//
//  DemoStructure.swift
//  ios-playground
//
//  Created by ηζδΌ on 2022/8/23.
//

import Foundation
import UIKit

struct DemoItem {
    let name: String
    let vc: UIViewController

    init(name: String, vc: UIViewController) {
        self.name = name
        self.vc = vc
    }
}
