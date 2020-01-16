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
        image.image = UIImage(named: "locator_icon")
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Donation Confirmed"
        setupView()
    }
    func setupView() {
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.95)
        self.view.addSubview(statusImage)
        self.view.addSubview(homeButton)
        statusImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        statusImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        homeButton.anchor(top: statusImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: stdPadding, size: .init(width: 100, height: 50))
    }
    @objc func navigateToHome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
