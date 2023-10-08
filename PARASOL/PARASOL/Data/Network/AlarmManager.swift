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
    
    // 알람 삭제
    func deleteAlarm(alarmId: Int, completion: @escaping (Result<Bool, Error>) -> Void ) {
        provider.request(.deleteAlarm(alarmId: String(alarmId))) { result in
            switch result {
            case .success(let response):
                // 서버 응답의 상태 코드를 확인
                let statusCode = response.statusCode
                if statusCode == 200 {
                    completion(.success(true))
                } else {
                    completion(.success(false))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
