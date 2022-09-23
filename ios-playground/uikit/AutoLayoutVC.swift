//
//  AutoLayoutVC.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/20.
//

// AutoLayout

import UIKit

class AutoLayoutVC: UIViewController {
    var vw: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        vw = UIView()
        vw.backgroundColor = .red
        view.addSubview(vw)

        vw.translatesAutoresizingMaskIntoConstraints = false

        let horizontalConstraint = NSLayoutConstraint(item: vw,
                                                      attribute: NSLayoutConstraint.Attribute.right,
                                                      relatedBy: NSLayoutConstraint.Relation.equal,
                                                      toItem: view,
                                                      attribute: NSLayoutConstraint.Attribute.right,
                                                      multiplier: 1,
                                                      constant: -5)
        let verticalConstraint = NSLayoutConstraint(item: vw,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: view,
                                                    attribute: NSLayoutConstraint.Attribute.bottom,
                                                    multiplier: 1,
                                                    constant: -5)
        let widthConstraint = NSLayoutConstraint(item: vw,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 50)
        let heightConstraint = NSLayoutConstraint(item: vw,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 50)
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }
}
