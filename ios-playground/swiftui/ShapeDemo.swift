//
//  ShapeDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/28.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack {
            // 矩形
            Rectangle()
                .foregroundColor(Color.red)
                .padding()
            // 圆角矩形
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .foregroundColor(Color.blue)
                .frame(height: 200)
            // 圆形
            Circle()
                .foregroundColor(Color.yellow)
            // 椭圆
            Ellipse()
                .foregroundColor(Color.pink)
                .frame(height: 200)
            // 胶囊型
            Capsule()
                .fill(Color.green)
                .frame(width: 200, height: 50)
        }
    }
}
