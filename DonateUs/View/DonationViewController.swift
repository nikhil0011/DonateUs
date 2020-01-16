//
//  DonationViewController.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import UIKit
fileprivate let stdPadding: UIEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
class DonationViewController: UIViewController {
    let amount: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.font = .boldSystemFont(ofSize: 12)
        textField.placeholder = "Enter Amount"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let intiateDonationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("PAY", for: .normal)
        button.setTitleColor(ColorPalette.whiteColor, for: .normal)
        button.tag = 0
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = ColorPalette.primaryColor.cgColor
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(intiateDonate), for: .touchUpInside)
        return button
    }()
    let donateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("DONATE", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(ColorPalette.whiteColor, for: .normal)
        button.tag = 0
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = ColorPalette.primaryColor.cgColor
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(submitDonationRequest), for: .touchUpInside)
        return button
    }()
    var donationViewModel = DonationViewModel()
    lazy var creditCardForm = CreditCardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @objc func intiateDonate() {
        
    }
    func setupView() {
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        self.view.addSubview(amount)
        self.view.addSubview(intiateDonationButton)
        self.view.addSubview(creditCardForm)
        self.view.addSubview(donateButton)
        let frame = self.view.safeAreaLayoutGuide
        amount.anchor(top: frame.topAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding)
        creditCardForm.anchor(top: amount.bottomAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding)
        donateButton.anchor(top: creditCardForm.bottomAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding, size: .init(width: 0, height: 45))
    }
    @objc func submitDonationRequest() {
        donationViewModel.submitDonation(body: ["name": "", "token": "", "amount": ""])
        observeDonationViewModel()
    }
    func observeDonationViewModel() {
        donationViewModel.bindableDontionForm.bind { (response, error) in
            debugPrint("Response\(String(describing: response))")
            debugPrint("ERROR \(error)")
        }
    }
}
