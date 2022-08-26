//
//  ImageDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit


class ImageDemo: SwiftWithUikitVC<ImageView>{
    
    override var body: ImageView{
        ImageView()
    }
    
}


struct ImageView: View{
    
    var body: some View{
        VStack{
            Image("test_image_02")
               .resizable()
               .clipShape(Circle())
               .frame(width: 200.0, height: 200.0)
               .overlay(Circle().stroke(Color.white,lineWidth:4).shadow(radius: 10))
        }
        
    }
    
}


struct Image_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
