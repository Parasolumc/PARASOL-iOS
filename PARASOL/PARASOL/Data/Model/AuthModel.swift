//
//  AuthModel.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/15.
//

import Foundation

// MARK: - 회원가입
// MARK: - UserJoinModel
struct UserJoinModel: Codable {
    let nickname, email, password: String
}

// MARK: - OwnerJoinModel
struct OwnerJoinModel: Codable {
    let nickname, email, password, shopName: String
    let latitude, longitude, roadNameAddress: String
}

// MARK: - 본인인증
// MARK: - VerifyModel
struct VerifyModel: Codable {
    let name, email, phoneNumber: String
}

// MARK: - VerifyCheckModel
struct VerifyCheckModel: Codable {
    let code, phoneNumber: String
}

// MARK: - 토큰갱신
// MARK: - RefreshTokenModel
struct RefreshTokenModel: Codable {
    let refreshToken: String
}
