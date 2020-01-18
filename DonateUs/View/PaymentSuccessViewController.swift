//
//  PaymentSuccessViewController.swift
//  DonateUs
//
//  Created by Nikhil on 16/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
import UIKit
fileprivate let stdPadding: UIEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
class PaymentSuccessViewController: UIViewController {
    let statusImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.contentMode  = .scaleAspectFit
        image.layer.masksToBounds = true
        image.image = UIImage(named: "icons8-ok")
        return image
    }()
    let homeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("BACK TO HOME", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.setTitleColor(ColorPalette.whiteColor, for: .normal)
        button.tag = 0
        button.layer.cornerRadius = 4
        button.layer.backgroundColor = ColorPalette.primaryColor.cgColor
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(navigateToHome), for: .touchUpInside)
        return button
    }()
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.attributedText = self.returnAttributedText(string1: "Payment Successful", font1: .boldSystemFont(ofSize: 16), string2: "\n A email confirmation would be sent to you shortly.".capitalized, font2: .systemFont(ofSize: 13), color1: UIColor.black.withAlphaComponent(0.9), color2: UIColor.darkGray.withAlphaComponent(0.9))
        label.sizeToFit()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Donation Confirmed"
        setupView()
    }
    func setupView() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(statusImage)
        self.view.addSubview(homeButton)
        self.view.addSubview(infoLabel)
        statusImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statusImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        statusImage.applyCGSizeToView(size: .init(width: 100, height: 100))
        infoLabel.anchor(top: statusImage.bottomAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, padding: stdPadding)
        homeButton.anchor(top: infoLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: stdPadding, size: .init(width: 200, height: 50))
        homeButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    @objc func navigateToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func returnAttributedText(string1: String, font1: UIFont, string2: String, font2: UIFont, color1: UIColor, color2: UIColor) -> NSMutableAttributedString {
        let attributedLabel = NSMutableAttributedString(attributedString: NSAttributedString(string: string1, attributes: [.font: font1, .foregroundColor: color1]))
        attributedLabel.append(NSAttributedString(string: "\(string2)", attributes: [.font: font2, .foregroundColor: color2]))
        return attributedLabel
    }
}
