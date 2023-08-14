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
    
    // 매장 리스트 조회
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
    
    // 특정 매장 조회
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
    
    // 우산 추가 등록
    func editUmbrella(editUmbrellaData: editUmbrellaModel, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.editUmbrella(param: editUmbrellaData)) { result in
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
    
    // 매장 검색
    func searchStores(SearchStoreModel: SearchStoreModel, completion: @escaping (Result<SearchedStoreModel, Error>) -> Void ) {
        provider.request(.searchStore(param: SearchStoreModel)) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SearchedStoreModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    // 사장님 본인 매장 조회
    func owner_getStore(completion: @escaping (Result<OwnerStoreModel, Error>) -> Void ) {
        provider.request(.ownerstore) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(OwnerStoreModel.self, from: data.data)
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
