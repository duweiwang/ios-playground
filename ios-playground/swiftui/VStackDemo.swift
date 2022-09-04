//
//  VStackDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/25.
//

import SwiftUI
import UIKit

class VStackDemo: SwiftWithUikitVC<VStackView> {
    override var body: VStackView {
        VStackView()
    }
}

struct VStackView: View {
    var body: some View {
        VStack {
            // 横向布局
            // alignment: 布局对齐格式, 默认为 .center
            // spacing: 子 View 的间距
            VStack(alignment: .trailing, spacing: 10) {
                Text("我是第一个asdasdsadLab")
                Text("我是第二个Lab")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)

            VStack {
                Text("我是第一个Labasdasdasdasdasd")
                Text("我是第二个Lab")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 10)

            VStack {
                Text("我在上")
                // 如何把 View 分到 上下两边呢
                // 增加 Spacer()
                Spacer()
                Text("你在下")
            }
            // 固定大小
            .frame(width: 200, height: 100)
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 10)
        }
    }
}
