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
    case deleteAlarm(alarmId: String)
}

extension AlarmAPI: TargetType {
    var baseURL: URL {
        switch self {
            
        case .getAlarmList:
            return ServiceAPI.baseURL!
        case .deleteAlarm(_):
            return ServiceAPI.baseURL!
        }
    }
    
    var path: String {
        switch self {
            
        case .getAlarmList:
            return "/api/notification"
        case .deleteAlarm(let id):
            return "/api/notification/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getAlarmList:
            return .get
        case .deleteAlarm(_):
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getAlarmList:
            return .requestPlain
        case .deleteAlarm(_):
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
