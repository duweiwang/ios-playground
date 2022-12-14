//
//  SwiftWithUikitVC.swift
//  ios-playground
//
//  Created by ηζδΌ on 2022/8/25.
//

import SwiftUI
import UIKit

class SwiftWithUikitVC<contentView: View>: UIViewController {
    private lazy var hostingVC = UIHostingController(rootView: body)

    var body: contentView {
        fatalError("need override this property")
    }

    override func loadView() {
        super.loadView()

        hostingVC.view.backgroundColor = .clear
        hostingVC.view.frame = view.bounds
        hostingVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addChild(hostingVC)
        view.addSubview(hostingVC.view)
        hostingVC.didMove(toParent: self)
    }
}
