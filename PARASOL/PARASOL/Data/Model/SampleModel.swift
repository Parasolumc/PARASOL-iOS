//
//  SampleModel.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import Foundation

struct Sample: Codable {
    var phoneNumber: String
    var birth: String
    
    init() {
        self.phoneNumber = ""
        self.birth = ""
    }
}
