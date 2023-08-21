//
//  CustomRequestMessage.swift
//  
//
//  Created by 김진규 on 2023/05/11.
//

import Foundation

final class CustomRequestMessage: WidgetMessageProtocol {
    typealias Response = PaymentMethodKey
    let jsonObject: [String: Any]
    init(jsonObject: [String: Any]) {
        self.jsonObject = jsonObject
    }
}
