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
    
    func ownerJoin(ownerJoinData: OwnerJoinModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.ownerJoin(param: ownerJoinData)) { result in
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
    
    func verify(verifyData: VerifyModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.verify(param: verifyData)) { result in
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
    
    func verifyCheck(verifyCheckData: VerifyCheckModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.verifyCheck(param: verifyCheckData)) { result in
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
    
    func refreshToken(refreshTokenData: RefreshTokenModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.refreshToken(param: refreshTokenData)) { result in
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
    
    // MARK: - 로그인 Manager
    func doLogin(loginData: LoginModel, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.login(param: loginData)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    if json["check"] as? Bool == true {
                        // MARK: - UserDefaults에 token 저장
                        let tokens: [String : String] = json["information"] as? [String : String] ?? ["accessToken": "", "refreshToken": ""]
                        UserDefaults.standard.set(tokens["accessToken"], forKey: "accessToken")
                        UserDefaults.standard.set(tokens["refreshToken"], forKey: "refreshToken")
                    }
                    completion(.success(json))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
