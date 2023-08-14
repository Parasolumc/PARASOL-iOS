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
}

extension MenuAPI: TargetType {
    
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    var path: String {
        switch self {
        case .rentalList:
            return "/api/history"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .rentalList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .rentalList:
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
