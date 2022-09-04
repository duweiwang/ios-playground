//
//  ProgressDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/26.
//

import SwiftUI
import UIKit

class ProgressDemo: SwiftWithUikitVC<MyProgressView> {
    override var body: MyProgressView {
        MyProgressView()
    }
}

struct MyProgressView: View {
    var body: some View {
        VStack {
            simpleProgress()
            progressWithText()
            lineProgressView()
            styleProgressView()
            btnProgressView()
            myStyle()
            myStyle2()
        }
    }

    func simpleProgress() -> some View {
        ProgressView()
    }

    func progressWithText() -> some View {
        ProgressView("loading..")
    }

    func lineProgressView() -> some View {
        ProgressView(value: 250, total: 1000)
    }

    func styleProgressView() -> some View {
        ProgressView("Please wait...")
            .progressViewStyle(CircularProgressViewStyle(tint: .purple))
            .foregroundColor(.green)
    }

    func btnProgressView() -> some View {
        ProgressView {
            Button(action: {
                // Do something to stop the task.
            }) {
                Text("Cancel download")
                    .foregroundColor(.white)
            }
            .padding(8)
            .background(Color.red)
            .cornerRadius(5)
        }
    }

    func myStyle() -> some View {
        ProgressView("Loading...", value: 25, total: 100)
            .progressViewStyle(RoundedRectProgressViewStyle())
    }

    func myStyle2() -> some View {
        ProgressView("Loading...", value: 50, total: 100)
            .progressViewStyle(CustomCircularProgressViewStyle())
    }
}

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 250, height: 28)
                .foregroundColor(.blue)
                .overlay(Color.black.opacity(0.5)).cornerRadius(14)

            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 28)
                .foregroundColor(.yellow)
        }
        .padding()
    }
}

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                .rotationEffect(.degrees(-90))
                .frame(width: 200)

            if let fractionCompleted = configuration.fractionCompleted {
                Text(fractionCompleted < 1 ?
                    "Completed \(Int((configuration.fractionCompleted ?? 0) * 100))%"
                    : "Done!"
                )
                .fontWeight(.bold)
                .foregroundColor(fractionCompleted < 1 ? .orange : .green)
                .frame(width: 180)
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MyProgressView()
    }
}
