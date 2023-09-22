//
//  AlarmModel.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/24.
//

import Foundation
// 알림 조회
// MARK: - AlarmModel
struct AlarmModel: Codable {
    let check: Bool
    let information: [AlarmInformation]
}

// MARK: - AlarmInformation
struct AlarmInformation: Codable {
    let id: Int
    let content, sentTime: String
    let recipientId, shopId: Int
    let type, shopName: String
}
