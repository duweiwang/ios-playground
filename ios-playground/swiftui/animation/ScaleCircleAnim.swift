//
//  ScaleCircleAnim.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/10/25.
//

import SwiftUI
import UIKit

class ScaleCircleAnim: SwiftWithUikitVC<ScaleCircleView> {
    override var body: ScaleCircleView {
        ScaleCircleView()
    }
}

struct ScaleCircleView: View {
    @State var scale = 1.0

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)

                withAnimation(repeated) {
                    scale = 0.5
                }
            }
    }
}

///
///
///通过添加拓展函数 便于使用
///
///

// Create an immediate animation.
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

// Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

// Try out our extensions with the scaling circle.
struct ContentView: View {
    @State var scale = 1.0

    var body: some View {
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .animateForever(autoreverses: true) { scale = 0.5 }
    }
}
