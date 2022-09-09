//
//  ToolbarDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/9.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("小王子的藝想世界")
                    .font(.largeTitle)
                Image("icon_whatsapp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {} label: {
                        Text("edit")
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                       Button("Cancel") {
                       }
                    }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {} label: {
                        Text("edit")
                    }

                    Button {} label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                       HStack {
                          Image("test_image_02")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 50, height: 50)
                             .offset(y: 1)
                          Text("Peter")
                       }
                    }
            }
        }
    }
}

struct ToolbarDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
