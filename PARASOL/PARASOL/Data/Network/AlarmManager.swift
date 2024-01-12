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
    
    // 푸쉬 알람 fcmToken 보내기
    func sendFcmToken(param: PushAlarmModel, completion: @escaping (Result<String, Error>) -> Void ) {
        provider.request(.sendFcmToken(param: param)) { result in
            switch result {
            case .success(let response):
                do {
                    // 서버 응답 데이터를 문자열로 변환
                    let responseString = try response.mapString()
                    completion(.success(responseString))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    
}
