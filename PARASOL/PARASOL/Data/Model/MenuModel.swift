//
//  MenuModel.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation

// MARK: 대여 현황 조회 / 대여 기록
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

// MARK: 판매한 우산 조회
// MARK: - SellRecordModel
struct SellRecordModel: Codable {
    let check: Bool
    let information: [SellRecordInformation]
}

// MARK: - SellRecordInformation
struct SellRecordInformation: Codable {
    let sellShop, createdAt: String
    let umbrellaCount: Int
}

// MARK: 결제 수단 등록


// MARK: 사장님 매장 정보 수정
// MARK: - EditInfoModel
struct EditInfoModel: Codable {
    let desc, openTime, closeTime: String
}

// MARK: 사장님 매장 사진 업로드


// MARK: 사장님 매장 사진 삭제
