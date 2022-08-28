//
//  GridDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/28.
// https://swiftwithmajid.com/2022/08/10/mastering-grid-layout-in-swiftui/
//

import SwiftUI
import UIKit


class GridDemo: SwiftWithUikitVC<GridView> {
    
    override var body: GridView {
        GridView()
    }
}


struct GridView: View {
    @State private var users = [
        User(name: "111", familyName: "111", age: 11),
        User(name: "222", familyName: "222", age: 22)
             ]
    
    var body: some View {
        
        Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(users) { user in
                        GridRow(alignment: .firstTextBaseline) {
                            Text(user.name)
                            Text(user.familyName)
                            Text(user.age.formatted())
                               
                        } .gridColumnAlignment(.trailing)
                    }
                }
        
    }
    
}

struct User: Identifiable{
    var id: String = UUID().uuidString
    
    let name: String
    let familyName: String
    let age: Int
    
    init(name: String, familyName: String, age: Int) {
        self.name = name
        self.familyName = familyName
        self.age = age
    }
}


