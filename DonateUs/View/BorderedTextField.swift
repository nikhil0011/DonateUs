//
//  BorderedTextField.swift
//  DonateUs
//
//  Created by Nikhil on 16/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit

class BorderedTextField: UITextField {
    let padding: CGFloat = 8
    var color: UIColor?
    init(color: UIColor?=nil) {
        super.init(frame: .zero)
        self.textAlignment = .left
        self.color = color
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect.offsetBy(dx: 32, dy: 12))
        addBottomBorderWithColor(color: color ?? UIColor.lightGray, width: 0.5)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
