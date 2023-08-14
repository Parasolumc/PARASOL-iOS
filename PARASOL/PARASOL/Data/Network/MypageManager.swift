//
//  MypageManager.swift
//  PARASOL
//
//  Created by Jini on 2023/08/15.
//

import Foundation
import Moya

class MypageManager {
    private init() {}
    static let shared = MypageManager()
    lazy var provider = MoyaProvider<MypageAPI>()
    
    func logOut(logOutData: LogoutModel, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.logout(param: logOutData)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error):
                completion(.failure(Error))
            }
        }
    }
}
