//
//  AlarmAPI.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/24.
//

import Foundation
import Moya

enum AlarmAPI {
    case getAlarmList
}

extension AlarmAPI: TargetType {
    var baseURL: URL {
        switch self {
            
        case .getAlarmList:
            return ServiceAPI.baseURL!
        }
    }
    
    var path: String {
        switch self {
            
        case .getAlarmList:
            return "/api/notification"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getAlarmList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getAlarmList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        default:
            return [ "Content-Type": "application/json",
                     "Authorization": "Bearer \(UserDefaults.standard.value(forKey: "accessToken") as! String)" ]
        }
    }
    
    
}
