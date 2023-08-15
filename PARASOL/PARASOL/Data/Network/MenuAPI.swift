//
//  MenuAPI.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation
import Moya

enum MenuAPI {
    case rentalList
    case rentalnow
    case sellUmbrella(id: Int)
    case sellRecord
}

extension MenuAPI: TargetType {
    
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .rentalList:
            return "/api/history"
        case .rentalnow:
            return "/api/history/now"
        case .sellUmbrella(let id):
            return "/api/sell/\(id)"
        case .sellRecord:
            return "/api/sell"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .rentalList:
            return .get
        case .rentalnow:
            return .get
        case .sellUmbrella(_):
            return .post
        case .sellRecord:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .rentalList:
            return .requestPlain
        case .rentalnow:
            return .requestPlain
        case .sellUmbrella(_):
            return .requestPlain
        case .sellRecord:
            return .requestPlain
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
