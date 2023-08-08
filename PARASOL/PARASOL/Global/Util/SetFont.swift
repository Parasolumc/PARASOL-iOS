//
//  SetFont.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit

enum BasicFont: String {
    case light = "Pretendard-Light"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semibold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"
}
extension UIFont {
    // bold(width:700)
    static let B14 = UIFont(name: BasicFont.bold.rawValue, size: 14)
    static let B16 = UIFont(name: BasicFont.bold.rawValue, size: 16)
    static let B18 = UIFont(name: BasicFont.bold.rawValue, size: 18)
    static let B20 = UIFont(name: BasicFont.bold.rawValue, size: 20)
    static let B24 = UIFont(name: BasicFont.bold.rawValue, size: 24)
    // semibold(width:600)
    static let SB16 = UIFont(name: BasicFont.semibold.rawValue, size: 16)
    // medium(width:500)
    static let M14 = UIFont(name: BasicFont.medium.rawValue, size: 14)
    static let M16 = UIFont(name: BasicFont.medium.rawValue, size: 16)
    static let M18 = UIFont(name: BasicFont.medium.rawValue, size: 18)
    // regular(width:400)
    static let R14 = UIFont(name: BasicFont.regular.rawValue, size: 14)
    static let R16 = UIFont(name: BasicFont.regular.rawValue, size: 16)
}
