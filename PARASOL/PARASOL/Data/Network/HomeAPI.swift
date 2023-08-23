//
//  HomeAPI.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/10.
//

import Foundation
import Moya

enum HomeAPI {
    case storeList
    case store(id: Int)
    case editUmbrella(param: editUmbrellaModel)
    case searchStore(param: SearchStoreModel)
    case ownerstore
}

extension HomeAPI: TargetType {
    // 서버의 base URL
    var baseURL: URL {
        return ServiceAPI.baseURL!
    }
    
    // 서버의 base URL 뒤에 추가 될 Path (API)
    var path: String {
        switch self {
        case .storeList:
            return "/api/shop"
        case .store(let id):
            return "/api/shop/\(id)"
        case .editUmbrella(param: _):
            return "/api/umbrella/add"
        case .searchStore(param: _):
            return "/api/shop/search"
        case .ownerstore:
            return "/api/shop/owner"
        }
    }
    
    // HTTP Method
    var method: Moya.Method {
        switch self {
        case .storeList:
            return .get
        case .store:
            return .get
        case .editUmbrella(param: _):
            return .post
        case .searchStore(param: _):
            return .get
        case .ownerstore:
            return .get
        }
    }
    
    // 요청에 사용되는 파라미터 설정
    var task: Moya.Task {
        switch self {
        case .storeList:
            return .requestPlain
        case .store:
            return .requestPlain
        case .editUmbrella(param: let param):
            return .requestJSONEncodable(param)
        case .searchStore(param: let param):
            let paramDict: [String : String] = ["keyword": param.keyword,
                                                "lat": param.userLatitude,
                                                "lon": param.userLongitude]
            return .requestParameters(parameters: paramDict, encoding: URLEncoding.queryString)
        case .ownerstore:
            return .requestPlain
        }
    }
    
    // HTTP headers
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json",
                    "Authorization": "Bearer \(UserDefaults.standard.value(forKey: "accessToken") as! String)"]
        }
    }
    
    
}
