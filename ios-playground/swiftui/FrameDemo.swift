//
//  FrameDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/27.
//
// https://swiftui-lab.com/frame-behaviors/
//

import SwiftUI
import UIKit

class FrameDemo:SwiftWithUikitVC<FrameView>{
    
    override var body: FrameView{
        FrameView()
    }
    
}

struct FrameView:View{
    var body: some View{
        VStack{
            ExampleView()
            
        }
    }
}


struct ExampleView: View {
    @State private var width: CGFloat = 50
    
    var body: some View {
        VStack {
            SubView()
                .frame(width: self.width, height: 120)
                .border(Color.blue, width: 2)
            
            Text("Offered Width \(Int(width))")
            Slider(value: $width, in: 0...200, step: 1)
        }
    }
}


struct SubView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(Color.yellow.opacity(0.7))
                .frame(width: max(proxy.size.width, 120), height: max(proxy.size.height, 120))
        }
    }
}
