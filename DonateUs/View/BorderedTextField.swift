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
    init() {
        super.init(frame: .zero)
        self.textAlignment = .left
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect.offsetBy(dx: 32, dy: 12))
        addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
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
}
