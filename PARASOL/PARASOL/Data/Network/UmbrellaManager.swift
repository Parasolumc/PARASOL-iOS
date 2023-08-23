//
//  UmbrellaManager.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/22.
//

import Foundation
import Moya

class UmbrellaManager {
    private init() {}
    static let shared = UmbrellaManager()
    lazy var provider = MoyaProvider<UmbrellaAPI>()
    
    // 대여 처리
    func rentUmbrella(userId: String, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.rentUmbrella(id: userId)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    if json["check"] as? Bool == true {
                        let information: [String : Any] = json["information"] as? [String : Any] ?? ["member": "",
                                                                                                     "fromShop": "",
                                                                                                     "endShop": "",
                                                                                                     "createdAt": "9999-12-31T23:59:00",
                                                                                                     "clearedAt": "9999-12-31T23:59:00",
                                                                                                    "process": "USE"]
                        completion(.success(information))
                    } else {
                        completion(.success(json))
                    }
                }
            case .failure(let Error):
                completion(.failure(Error))
            }
        }
    }
    
    // 반납 처리
    func returnUmbrella(userId: String, completion: @escaping (Result<[String : String], Error>) -> Void ) {
        provider.request(.returnUmbrella(id: userId)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    if json["check"] as? Bool == true {
                        let information: [String : String] = json["information"] as? [String : String] ?? ["member": "",
                                                                                                     "fromShop": "",
                                                                                                     "endShop": "",
                                                                                                     "createdAt": "9999-12-31T23:59:00",
                                                                                                     "clearedAt": "9999-12-31T23:59:00",
                                                                                                    "process": "CLEAR"]
                        completion(.success(information))
                    }
                } else {
                    completion(.success(["message" : "반납처리 할 우산이 없습니다."]))
                }
                
            case .failure(let Error):
                completion(.failure(Error))
            }
        }
    }
}
