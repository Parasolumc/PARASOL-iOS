//
//  mapMarker.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/07.
//

import UIKit

class mapMarker: UIButton {

    init(_ umbrellaNum: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        
        self.setImage(UIImage(named: "umbrella"), for: .normal)
        self.setTitle(" " + String(umbrellaNum), for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setDimensions(height: 44, width: 60)
        self.layer.cornerRadius = 22
        self.backgroundColor = UIColor(named: "main")
        
        // 마커에 그림자 추가
        self.layer.shadowColor = UIColor(named: "gray22")!.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    override func draw(_ rect: CGRect) {
        // Drawing code
    }*/

}
