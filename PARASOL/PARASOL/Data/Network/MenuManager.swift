//
//  MenuManager.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation
import Moya

class MenuManager {
    private init() {}
    static let shared = MenuManager()
    lazy var provider = MoyaProvider<MenuAPI>()
    
    func user_getRentalList(completion: @escaping (Result<RentalListModel, Error>) -> Void ) {
        provider.request(.rentalList) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(RentalListModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sellUmbrella(id: Int, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.sellUmbrella(id: id)) { result in
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
    
    func user_getSellRecord(completion: @escaping (Result<SellRecordModel, Error>) -> Void ) {
        provider.request(.sellRecord) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SellRecordModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func editShopInfo(editShopInfoData: EditInfoModel, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.editInfo(param: editShopInfoData)) { result in
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
    
    func upLoadPhoto(image: UIImage, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.uploadPhoto(image: image)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error):
                // 업로드 실패 시 처리
                completion(.failure(Error))
            }
        }
    }
    
    
    
    
    
}

