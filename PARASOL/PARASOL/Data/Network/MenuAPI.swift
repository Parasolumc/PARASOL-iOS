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
    case editInfo(param: EditInfoModel)
    case uploadPhoto(image: UIImage)
    case deletePhoto(id: Int)
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
        case .editInfo(param: _):
            return "/api/shop/info"
        case .uploadPhoto(image: _):
            return "/api/shop/image"
        case .deletePhoto(let id):
            return "/api/shop/image/\(id)"
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
        case .editInfo:
            return .put
        case .uploadPhoto(_):
            return .post
        case .deletePhoto(_):
            return .delete
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
        case .editInfo(param: let param):
            return .requestJSONEncodable(param)
        case .uploadPhoto(let image):
            let imageData = MultipartFormData(provider: .data(image.jpegData(compressionQuality: 1.0)!), name: "image", fileName: "jpeg", mimeType: "image/jpeg")
            return .uploadMultipart([imageData])
        case .deletePhoto(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .uploadPhoto(image: _):
            return [ "Content-Type": "multipart/form-data",
                    "Authorization": "Bearer \(ServiceAPI.token)" ]
        default:
            return [ "Content-Type": "application/json",
                    "Authorization": "Bearer \(ServiceAPI.token)" ]
        }
    }
    
    
}
