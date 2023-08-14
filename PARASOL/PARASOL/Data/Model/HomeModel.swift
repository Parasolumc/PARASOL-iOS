//
//  HomeModel.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/10.
//

import Foundation

// MARK: - 매장 리스트 조회
// MARK: [StoreListModel]
struct StoreListModel: Codable {
    let check: Bool
    let information: [StoreListInformation]
}

// MARK: [StoreListInformation]
struct StoreListInformation: Codable {
    let id: Int
    let shopName: String
    let latitude, longitude: Double
    let roadNameAddress: String
    var openTime, closeTime: String
    let availableUmbrella, unavailableUmbrella: Int
}

// MARK: - 특정 가게 조회
// MARK: [StoreModel]
struct StoreModel: Codable {
    let check: Bool
    let information: StoreInformation
}

// MARK: [StoreInformation]
struct StoreInformation: Codable {
    let id: Int
    let shopName, desc: String
    let latitude, longitude: Double
    let roadNameAddress, openTime, closeTime: String
    let availableUmbrella: Int
    let image: [StoreImage]
}

// MARK: [StoreImage]
struct StoreImage: Codable {
    let id: Int
    let url: String
}
