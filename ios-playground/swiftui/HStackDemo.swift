//
//  HStackDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit

class HSatckDemo: SwiftWithUikitVC<HStackView> {
    override var body: HStackView {
        HStackView()
    }
}

struct HStackView: View {
    var body: some View {
        VStack {
            // 横向布局
            // alignment: 布局对齐格式, 默认为 .center
            // spacing: 子 View 的间距, 系统默认为 8
            HStack(alignment: .bottom, spacing: 20) {
                Text("我是第一个Lab\nasdasd\nasdas")
                Text("我是第二个Lab")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)

            HStack {
                Text("我是第一个Lab\nasdasd\nasdas")
                Text("我是第二个Lab")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 10)

            HStack {
                Text("我在左边")
                // 如何把 View 分到 左右两边呢
                // 增加 Spacer()
                Spacer()
                Text("我在右边")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 10)
        }
    }
}

struct HStackTest_Previews: PreviewProvider {
    static var previews: some View {
        HStackView()
    }
}
