//
//  ColorPallete.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
import UIKit
struct ColorPalette {
    static let whiteColor = UIColor.white
    static let primaryColor = hexStringToUIColor(hex: "215cec")
    static func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        if ((cString.count) != 6) { return UIColor.gray }
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        let color = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
        return color
    }
}
