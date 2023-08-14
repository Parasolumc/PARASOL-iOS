//
//  AuthManager.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/15.
//

import Foundation
import Moya

class AuthManager {
    private init() {}
    static let shared = AuthManager()
    lazy var provider = MoyaProvider<AuthAPI>()
    
    func userJoin(userJoinData: UserJoinModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.userJoin(param: userJoinData)) { result in
            switch result {
            case .success(let data) :
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error) :
                completion(.failure(Error))
            }
        }
    }
}
