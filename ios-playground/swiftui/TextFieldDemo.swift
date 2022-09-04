//
//  TextFieldDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//

import SwiftUI
import UIKit


class TextFieldDemo :SwiftWithUikitVC<TextFieldView> {
    override var body: TextFieldView {
        TextFieldView()
    }
}

struct TextFieldView: View {
    
    @State var username: String = ""
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Username")
                    .font(.callout)
                    .bold()
            
            TextField("Enter username...", text: $username, onEditingChanged: { (changed) in
                print("Username onEditingChanged - \(changed)")
            }) {
                print("Username onCommit")
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(Color.blue)
            .background(Color.blue)
            
            
            Text("Your username: \(username)")
        }.padding()
    }
}

