//
//  MypageModel.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation

// MARK: - RentalListModel
struct RentalListModel: Codable {
    let check: Bool
    let information: Information
}

// MARK: - Information
struct Information: Codable {
    let member, fromShop: String
    let endShop: JSONNull?
    let createdAt: String
    let clearedAt: JSONNull?
    let process: String
}
