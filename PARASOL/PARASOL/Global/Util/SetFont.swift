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
    static let B8 = UIFont(name: BasicFont.bold.rawValue, size: 8)
    static let B10 = UIFont(name: BasicFont.bold.rawValue, size: 10)
    static let B14 = UIFont(name: BasicFont.bold.rawValue, size: 14)
    static let B16 = UIFont(name: BasicFont.bold.rawValue, size: 16)
    static let B18 = UIFont(name: BasicFont.bold.rawValue, size: 18)
    static let B20 = UIFont(name: BasicFont.bold.rawValue, size: 20)
    static let B24 = UIFont(name: BasicFont.bold.rawValue, size: 24)
    static let B25 = UIFont(name: BasicFont.bold.rawValue, size: 25)
    // semibold(width:600)
    static let SB8 = UIFont(name: BasicFont.semibold.rawValue, size: 8)
    static let SB12 = UIFont(name: BasicFont.semibold.rawValue, size: 12)
    static let SB14 = UIFont(name: BasicFont.semibold.rawValue, size: 14)
    static let SB16 = UIFont(name: BasicFont.semibold.rawValue, size: 16)
    static let SB18 = UIFont(name: BasicFont.semibold.rawValue, size: 18)
    static let SB20 = UIFont(name: BasicFont.semibold.rawValue, size: 20)
    static let SB22 = UIFont(name: BasicFont.semibold.rawValue, size: 22)
    // medium(width:500)
    static let M12 = UIFont(name: BasicFont.medium.rawValue, size: 12)
    static let M14 = UIFont(name: BasicFont.medium.rawValue, size: 14)
    static let M16 = UIFont(name: BasicFont.medium.rawValue, size: 16)
    static let M18 = UIFont(name: BasicFont.medium.rawValue, size: 18)
    // regular(width:400)
    static let R8 = UIFont(name: BasicFont.regular.rawValue, size: 8)
    static let R13 = UIFont(name: BasicFont.regular.rawValue, size: 13)
    static let R14 = UIFont(name: BasicFont.regular.rawValue, size: 14)
    static let R15 = UIFont(name: BasicFont.regular.rawValue, size: 15)
    static let R16 = UIFont(name: BasicFont.regular.rawValue, size: 16)
}
