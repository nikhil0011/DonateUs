//
//  Urls.swift
//  DonateUs
//
//  Created by Nikhil on 14/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//
import Foundation
struct EndPoints {
    static let BASE_URL: String = "https://virtserver.swaggerhub.com/chakritw/tamboon-api/1.0.0"
    static let GET_CONTACTS: String = "/charities"
    static let SUBMIT_DONATION: String = "/donations"
    static func returnContactDetailUrl(id: Int) -> String {
        return BASE_URL + "/contacts/" + "\(id)" + ".json"
    }
}
