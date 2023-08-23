//
//  UmbrellaModel.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/22.
//

import Foundation
import Moya

// MARK: 대여 처리
// MARK: - RentReturnModel
struct RentReturnModel: Codable {
    let check: Bool
    let information: [RentReturnInformation]
}

// MARK: - RentReturnInformation
struct RentReturnInformation: Codable {
    let member, fromShop, endShop, createdAt, clearedAt, process: String
}
