//
//  HomeModel.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/10.
//

import Foundation

// MARK: - StoreListModel
struct StoreListModel: Codable {
    let check: Bool
    let information: [Information]
}

// MARK: - Information
struct Information: Codable {
    let id: Int
    let shopName: String
    let latitude, longitude: Double
    let roadNameAddress: String
    var openTime, closeTime: String
    let availableUmbrella, unavailableUmbrella: Int
}

