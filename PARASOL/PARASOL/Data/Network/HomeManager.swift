//
//  HomeManager.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/10.
//

import Foundation
import Moya

class HomeManager {
    private init() {}
    static let shared = HomeManager()
    lazy var provider = MoyaProvider<HomeAPI>()
    
    func user_getStoreList(completion: @escaping (Result<StoreListModel, Error>) -> Void ) {
        provider.request(.storeList) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(StoreListModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func user_getStore(_ id: Int, completion: @escaping (Result<StoreModel, Error>) -> Void ) {
        provider.request(.store(id: id)) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(StoreModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
