//
//  DonationViewController.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
import UIKit
fileprivate let sizeOfField: CGSize = .init(width: 0, height: 35)
fileprivate let stdPadding: UIEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
class DonationViewController: UIViewController {
    let donationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.text = "Enter Donation Amount(in ฿)"
        label.sizeToFit()
        label.font = .boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let amount: UITextField = {
        let textField = BorderedTextField()
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.clearButtonMode = .whileEditing
        textField.font = .boldSystemFont(ofSize: 15)
        textField.placeholder = "Enter Amount(in ฿)".uppercased()
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
        return button
    }()
    var donationViewModel = DonationViewModel()
    lazy var creditCardForm = CreditCardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.97)
        self.title = "Donate"
        donateButton.addTarget(self, action: #selector(submitDonationRequest), for: .touchUpInside)
        setupView()
    }
    @objc func intiateDonate() {}
    func setupView() {
        self.view.addSubview(donationLabel)
        self.view.addSubview(amount)
        self.view.addSubview(intiateDonationButton)
        self.view.addSubview(creditCardForm)
        self.view.addSubview(donateButton)
        let frame = self.view.safeAreaLayoutGuide
        donationLabel.anchor(top: frame.topAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding)
        amount.anchor(top: donationLabel.bottomAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding, size: sizeOfField)
        creditCardForm.anchor(top: amount.bottomAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding)
        donateButton.anchor(top: creditCardForm.bottomAnchor, leading: frame.leadingAnchor, bottom: nil, trailing: frame.trailingAnchor, padding: stdPadding, size: .init(width: 0, height: 45))
    }
    @objc func submitDonationRequest() {
        guard validateForm() else { return }
        ActivityIndicator.shared.showProgressView(self.view)
        let param: [String: String] = [
            "name": creditCardForm.name.text!,
            "token": "",
            "amount": self.amount.text!
        ]
        donationViewModel.submitDonation(body: param)
        observeDonationViewModel()
    }
    func observeDonationViewModel() {
        donationViewModel.bindableDontionForm.bind { [weak self] (response, error) in
            guard let reference = self else { return }
            DispatchQueue.main.async {
                ActivityIndicator.shared.hideProgressView()
            }
            if let err = error {
                debugPrint("Error in Fetching Data From Chairty API \(err)")
                return
            }
            DispatchQueue.main.async {
                reference.navigationController?.pushViewController(PaymentSuccessViewController(), animated: true)
            }
        }
    }
    func present(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    func validateForm() -> Bool {
        let validations = Validations()
        guard validations.isValidText(text: amount.text!), let amt = amount.text, Int(amt) ?? 0 > 0 else {
            let alert = AlertController.showAlert(message: Constants.invalidAmt, title: Constants.alert) { (action) in }
            self.present(alert: alert)
            return false
        }
        guard validations.isValidText(text: creditCardForm.name.text!) else {
            let alert = AlertController.showAlert(message: Constants.invalidName, title: Constants.alert) { (action) in }
            self.present(alert: alert)
            return false
        }
        return true
    }
}
