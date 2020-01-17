//
//  CreditCardView.swift
//  DonateUs
//
//  Created by Nikhil on 16/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit
fileprivate let sizeOfField: CGSize = .init(width: 0, height: 35)
class CreditCardView: UIView {
    let cardNumber: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "XXXX XXXX XXXX XXXX"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let cvvNumber: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "CVV"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let expiryNumber: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "MM/YY"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let name: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "Name On Card"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCorners(corners: .allCorners, radius: 4)
        self.backgroundColor = ColorPalette.whiteColor
    }
    func addCustomView() {
        addSubview(cardNumber)
        addSubview(cvvNumber)
        addSubview(expiryNumber)
        addSubview(name)
        name.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 4, bottom: 0, right: 4), size: sizeOfField)
        cardNumber.anchor(top: name.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 4, bottom: 0, right: 4), size: sizeOfField)
        cvvNumber.anchor(top: cardNumber.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 4, bottom: 8, right: 4), size: sizeOfField)
        expiryNumber.anchor(top: cardNumber.bottomAnchor, leading: cvvNumber.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 12, bottom: 8, right: 4), size: sizeOfField)
    }
}
