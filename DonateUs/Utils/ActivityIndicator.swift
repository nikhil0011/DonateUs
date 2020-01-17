//
//  ActivityIndicator.swift
//  DonateUs
//
//  Created by Nikhil on 16/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation
import UIKit
open class ActivityIndicator {
    var containerView = UIView()
    var progressView = UIImageView()
    var activityIndicator = UIActivityIndicatorView()
    open class var shared: ActivityIndicator {
        struct Static {
            static let instance: ActivityIndicator = ActivityIndicator()
        }
        return Static.instance
    }
    // Showing Progress view
    open func showProgressView(_ view: UIView) {
        view.endEditing(true)
        containerView.frame = view.frame
        containerView.center = view.center
        if containerView.frame.origin.y > 0 {
            containerView.frame.origin.y = -64.0
        } else {
            containerView.frame.origin.y = 0.0
        }
        
        containerView.backgroundColor = ColorPalette.hexStringToUIColor(hex: "ffffff").withAlphaComponent(0.3)
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = view.center
        progressView.backgroundColor = ColorPalette.hexStringToUIColor(hex: "444444").withAlphaComponent(0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    open func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}

