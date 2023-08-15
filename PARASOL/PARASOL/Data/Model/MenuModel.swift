//
//  MenuModel.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation

// MARK: - RentalListModel
struct RentalListModel: Codable {
    let check: Bool
    let information: [RentalRecordInformation]
}

// MARK: - RentalRecordInformation
struct RentalRecordInformation: Codable {
    let member: String
    let fromShop: String
    let endShop: String
    let createdAt: String
    let clearedAt: String
    let process: String
}

// MARK: - SellRecordModel
struct SellRecordModel: Codable {
    let check: Bool
    let information: [SellRecordInformation]
}

// MARK: - Information
struct SellRecordInformation: Codable {
    let sellShop, createdAt: String
    let umbrellaCount: Int
}
