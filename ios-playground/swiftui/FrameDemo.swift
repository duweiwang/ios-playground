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

class FrameDemo: SwiftWithUikitVC<FrameView> {
    override var body: FrameView {
        FrameView()
    }
}

struct FrameView: View {
    var body: some View {
        VStack {
            ExampleView()

            ExampleView2()
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
            Slider(value: $width, in: 0 ... 200, step: 1)
        }
    }
}

struct ExampleView2: View {
    @State private var width: CGFloat = 150
    @State private var fixedSize: Bool = true

    var body: some View {
        GeometryReader { proxy in

            VStack {
                Spacer()

                VStack {
                    LittleSquares(total: 7)
                        .border(Color.green)
                        .fixedSize(horizontal: self.fixedSize, vertical: false)
                }
                .frame(width: self.width)
                .border(Color.primary)
                .background(MyGradient())

                Spacer()

                Form {
                    Slider(value: self.$width, in: 0 ... proxy.size.width)
                    Toggle(isOn: self.$fixedSize) { Text("Fixed Width") }
                }
            }
        }.padding(.top, 140)
    }
}

struct LittleSquares: View {
    let sqSize: CGFloat = 20
    let total: Int

    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 5) {
                ForEach(0 ..< self.maxSquares(proxy), id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 5).frame(width: self.sqSize, height: self.sqSize)
                        .foregroundColor(self.allFit(proxy) ? .green : .red)
                }
            }
        }.frame(idealWidth: (5 + self.sqSize) * CGFloat(self.total), maxWidth: (5 + self.sqSize) * CGFloat(self.total))
    }

    func maxSquares(_ proxy: GeometryProxy) -> Int {
        return min(Int(proxy.size.width / (sqSize + 5)), total)
    }

    func allFit(_ proxy: GeometryProxy) -> Bool {
        return maxSquares(proxy) == total
    }
}

struct MyGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.1), Color.green.opacity(0.1)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
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
