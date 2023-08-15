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
    case ownerJoin(param: OwnerJoinModel)
    case verify(param: VerifyModel)
    case verifyCheck(param: VerifyCheckModel)
    case refreshToken(param: RefreshTokenModel)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .userJoin(param: _):
            return "/auth/sign-up/customer"
        case .ownerJoin(param: _):
            return "/auth/sign-up/owner"
        case .verify(param: _):
            return "/verify"
        case .verifyCheck(param: _):
            return "/verify/check"
        case .refreshToken(param: _):
            return "/auth/refresh"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .userJoin(param: _):
            return .post
        case .ownerJoin(param: _):
            return .post
        case .verify(param: _):
            return .post
        case .verifyCheck(param: _):
            return .post
        case .refreshToken(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .userJoin(param: let param):
            return .requestJSONEncodable(param)
        case .ownerJoin(param: let param):
            return .requestJSONEncodable(param)
        case .verify(param: let param):
            return .requestJSONEncodable(param)
        case .verifyCheck(param: let param):
            return .requestJSONEncodable(param)
        case .refreshToken(param: let param):
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
