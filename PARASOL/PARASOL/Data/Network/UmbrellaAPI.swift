//
//  UmbrellaAPI.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/22.
//

import Foundation
import Moya

enum UmbrellaAPI {
    case rentUmbrella(id: String)
    case returnUmbrella(id: String)
    case sellUmbrella(id: String)
}

extension UmbrellaAPI: TargetType {
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .rentUmbrella(let id):
            return "/api/umbrella/rental/\(id)"
        case .returnUmbrella(let id):
            return "/api/umbrella/return/\(id)"
        case .sellUmbrella(let id):
            return "/api/sell/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .rentUmbrella(_):
            return .post
        case .returnUmbrella(_):
            return .post
        case .sellUmbrella(_):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .rentUmbrella(_):
            return .requestPlain
        case .returnUmbrella(_):
            return .requestPlain
        case .sellUmbrella(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(UserDefaults.standard.value(forKey: "accessToken") as! String)" ]
        }
    }
    
    
}
