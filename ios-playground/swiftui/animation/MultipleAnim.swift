//
//  MultipleAnim.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/10/26.
//
import SwiftUI
import UIKit

class MultipleAnim: SwiftWithUikitVC<MultipleAnimView> {
    override var body: MultipleAnimView {
        MultipleAnimView()
    }
}

struct MultipleAnimView: View {
    @State private var isEnabled = false

    var body: some View {
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .background(isEnabled ? .green : .red)
        .animation(nil, value: isEnabled)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
        .animation(.default, value: isEnabled)
    }
}
