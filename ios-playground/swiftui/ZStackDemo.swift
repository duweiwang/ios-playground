//
//  ZStackDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit

class ZStackDemo :SwiftWithUikitVC<ZStackView>{
    
    override var body: ZStackView{
        ZStackView()
    }
}

struct ZStackView: View {
    var body: some View {
        VStack {
            
            // 重叠向布局
            // alignment: 布局对齐格式, 默认为 .center
            ZStack.init(alignment: .topLeading) {
                Text("Hello, World!我对齐头部")
                Text("阿哈哈哈哈\nasdhasd\nasdj")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            
            ZStack {
                Text("Hello, World!我对齐中间")
                Text("阿哈哈哈哈\nasdhasd")
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 10)
            
            ZStack {
                Rectangle()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .frame(width: 300, height: 200)
                Text("阿哈哈哈哈\nasdhasd")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .shadow(radius: 20)
            .padding(.top, 10)
            
        }
        
    }
}

struct ZStackTest_Previews: PreviewProvider {
    static var previews: some View {
        ZStackView()
    }
}
