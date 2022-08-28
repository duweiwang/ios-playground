//
//  TextDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit
import MarkdownUI
import RichText


class TextDemo:SwiftWithUikitVC<TextView>{
    
    override var body: TextView{
        TextView()
    }
}


struct TextView: View{
    
    let text = "<span style=\"color:red\">开源库渲染Html</span>"
    let longText = "超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本超长文本"
    
    let markdown = "##开源库渲染_Markdown_"
    
    var body: some View{
      
        VStack{
            Markdown(markdown)
            .markdownStyle(
              MarkdownStyle(
                font: .system(.body, design: .serif),
                foregroundColor: .indigo,
                measurements: .init(
                  codeFontScale: 0.8,
                  headingSpacing: 0.3
                )
              )
            )
            
            
            RichText(html: text)
            
            Text(longText)
                .lineLimit(2)//限制行数
                .truncationMode(.middle)//省略中间部分
            
        }
    }
    
}

