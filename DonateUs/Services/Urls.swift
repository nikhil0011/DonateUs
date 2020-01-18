//
//  Urls.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
import UIKit
struct EndPoints {
    static let BASE_URL: String = "https://virtserver.swaggerhub.com/chakritw/tamboon-api/1.0.0"
    static let GET_CONTACTS: String = "/charities"
    static let SUBMIT_DONATION: String = "/donations"
    static func returnContactDetailUrl(id: Int) -> String {
        return BASE_URL + "/contacts/" + "\(id)" + ".json"
    }
}
class Validations {
    func isValidText(text: String) -> Bool {
        guard !text.isBlank, text.canBeConverted(to: .ascii), !text.doesSpecialCharExist()  else { return false }
        return true
    }
    func isValidCVV(text: String) -> Bool {
        guard text.count == 3, !text.doesSpecialCharExist() else { return false }
        return true
    }
}
class AlertController {
    static func showAlert( message: String, title: String, actionTitle: String?=nil, okAction : @escaping (UIAlertAction) -> Void) -> UIAlertController{
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var title: String = "Okay"
        if actionTitle != nil {
            title = actionTitle!
        }
        let doneAction = UIAlertAction(title: title, style: .default, handler: okAction )
        alertController.addAction(doneAction)
        return alertController
    }
}
struct Constants {
    static let nameRegex: NSCharacterSet = NSCharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
    static let invalidAmt: String =  "Please Enter Correct Amount\n(Greater Than 0)"
    static let invalidName: String = "Please Enter Cardholders Name"
    static let alert: String = "Alert"
    static let successMsg: NSMutableAttributedString = returnAttributedText(string1: "Payment Successful", font1: .boldSystemFont(ofSize: 16), string2: "\n A email confirmation would be sent to you shortly.".capitalized, font2: .systemFont(ofSize: 13), color1: UIColor.black.withAlphaComponent(0.9), color2: UIColor.darkGray.withAlphaComponent(0.9))
    // MARK: Attribute Text Generator
    static func returnAttributedText(string1: String, font1: UIFont, string2: String, font2: UIFont, color1: UIColor, color2: UIColor) -> NSMutableAttributedString {
        let attributedLabel = NSMutableAttributedString(attributedString: NSAttributedString(string: string1, attributes: [.font: font1, .foregroundColor: color1]))
        attributedLabel.append(NSAttributedString(string: "\(string2)", attributes: [.font: font2, .foregroundColor: color2]))
        return attributedLabel
    }
}
