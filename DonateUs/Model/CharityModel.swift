//
//  CharityModel.swift
//  DonateUs
//
//  Created by Nikhil on 15/01/20.
//  Copyright © 2020 Nikhil. All rights reserved.
//

import Foundation
// MARK: - ChairtyListResponse
struct ChairtyListResponse: Codable {
    let total: Int
    let data: [Organisation]
}

// MARK: - Datum
struct Organisation: Codable {
    let id: Int
    let name: String
    let logoURL: String
    enum CodingKeys: String, CodingKey {
        case id, name
        case logoURL = "logo_url"
    }
}
struct GenericResponse {
    let status: Int
    let success: Bool
}
