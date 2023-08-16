//
//  image.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/17.
//

import Foundation
import UIKit

// URL로 이미지 넣기
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
