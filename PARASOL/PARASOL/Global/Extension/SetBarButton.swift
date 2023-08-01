//
//  SetBarButton.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/01.
//

import SwiftUI

extension UIBarButtonItem {

    static func menuButton(_ target: Any?, action: Selector, imageName: String, size: Int, color: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = UIColor(named: color)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true

        return menuBarItem
    }
}
