//
//  MypageAPI.swift
//  PARASOL
//
//  Created by Jini on 2023/08/15.
//

import Foundation
import Moya

enum MypageAPI {
    case logout(param: LogoutModel)
    case changePw(param: ChangePwModel)
}

extension MypageAPI: TargetType {
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .logout(param: _):
            return "/auth/sign-out"
        case .changePw(param: _):
            return "/api/change-password"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logout(param: _):
            return .post
        case .changePw(param: _):
            return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .logout(param: let param):
            return .requestJSONEncodable(param)
        case .changePw(param: let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [ "Content-Type": "application/json",
                    "Authorization": "Bearer \(ServiceAPI.token)" ]
        }
    }
    
    
}
