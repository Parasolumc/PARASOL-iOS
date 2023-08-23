//
//  Endpoint.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import Foundation

enum ServiceAPI {
    static let baseURL = URL(string: "https://parasol-api.p-e.kr")
    static let token = UserDefaults.standard.value(forKey: "accessToken") as! String
    static let refreshtoken = UserDefaults.standard.value(forKey: "refreshToken") as! String
    static let memberID = UserDefaults.standard.value(forKey: "memberId") as! Int
}
