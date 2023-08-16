//
//  Endpoint.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import Foundation

enum ServiceAPI {
    static let baseURL = URL(string: "https://www.umc-parasol.r-e.kr")
    static let token = UserDefaults.standard.value(forKey: "accessToken")
    static let refreshtoken = UserDefaults.standard.value(forKey: "refreshToken")
}
