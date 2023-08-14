//
//  AuthModel.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/15.
//

import Foundation

// MARK: - UserJoinModel
struct UserJoinModel: Codable {
    let nickname, email, password: String
}
