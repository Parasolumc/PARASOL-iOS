//
//  AlarmManager.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/24.
//

import Foundation
import Moya

class AlarmManager {
    private init() {}
    static let shared = AlarmManager()
    lazy var provider = MoyaProvider<AlarmAPI>()
    
    // 알람 조회
    func getAlarmList(completion: @escaping (Result<AlarmModel, Error>) -> Void ) {
        provider.request(.getAlarmList) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(AlarmModel.self, from: data.data)
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
