//
//  ImageDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit

class ImageDemo: SwiftWithUikitVC<ImageView> {
    override var body: ImageView {
        ImageView()
    }
}

struct ImageView: View {
    var body: some View {
        VStack {
            Image("test_image_02")
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4).shadow(radius: 10))

            // 网络图加载
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: "https://dummyimage.com/80x80/d934d9/ffffff.png")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 48, height: 48)
                            .padding(.top, 16)
                            .padding(.bottom, 12)
                    case let .success(img):
                        img
                            .resizable()
                            .frame(width: 48, height: 48)
                            .cornerRadius(12)
                            .padding(.top, 16)
                            .padding(.bottom, 12)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .cornerRadius(12)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48, height: 48)
                            .padding(.top, 16)
                            .padding(.bottom, 12)
                    @unknown default:
                        EmptyView()
                    }
                }
            }

            /// 使用AF加载网络图并缓存
        }
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
