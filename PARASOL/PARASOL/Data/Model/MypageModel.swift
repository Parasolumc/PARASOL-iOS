//
//  MypageModel.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation

// MARK: 로그아웃
// MARK: - LogoutModel
struct LogoutModel: Codable {
    let refreshToken: String
}

// MARK: 비밀번호 변경
// MARK: - ChangePwModel
struct ChangePwModel: Codable {
    let oldPw, newPw, reNewPw, refreshToken: String
}

// MARK: - ChangePwResponseModel
struct ChangePwResponseModel: Decodable {
    let check: Bool
    let information: String
}
