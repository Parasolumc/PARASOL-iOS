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
    let times: [Time]
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
    let roadNameAddress: String
    let availableUmbrella: Int
    let image: [StoreImage]
    let times: [Time]
}

// MARK: [StoreImage]
struct StoreImage: Codable {
    let id: Int
    let url: String
}

// MARK: [Time]
struct Time: Codable {
    let day, openTime, endTime: String
}

// MARK: - 우산 추가 등록
// MARK: [editUmbrellaModel]
struct editUmbrellaModel: Codable {
    let count: Int
}

// MARK: - 매장 검색
// MARK: [SearchStoreModel]
struct SearchStoreModel: Codable {
    let keyword, userLatitude, userLongitude: String
}

// MARK: - SearchedStoreModel
struct SearchedStoreModel: Codable {
    let check: Bool
    let information: [SearchedStoreInformation]
}

// MARK: - SearchedStoreInformation
struct SearchedStoreInformation: Codable {
    let id: Int
    let shopName, roadNameAddress, distance: String
}

// MARK: - 사장님 본인 매장 조회
// MARK: - OwnerStoreModel
struct OwnerStoreModel: Codable {
    let check: Bool
    let information: OwnerStoreInformation
}

// MARK: - OwnerStoreInformation
struct OwnerStoreInformation: Codable {
    let id: Int
    let shopName, desc: String
    let latitude, longitude: Double
    let roadNameAddress, openTime, closeTime: String
    let availableUmbrella: Int
    let image: [Image]
}

// MARK: - Image
struct Image: Codable {
    let id: Int
    let url: String
}
