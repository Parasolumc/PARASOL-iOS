//
//  AuthAPI.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/15.
//

import Foundation
import Moya

enum AuthAPI {
    case userJoin(param: UserJoinModel)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .userJoin(param: _):
            return "/auth/sign-up/customer"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userJoin(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .userJoin(param: let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        default:
            return ["Content-Type" : "application/json"]
        }
    }
}
