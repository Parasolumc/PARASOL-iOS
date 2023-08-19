//
//  PaywayVC.swift
//  PARASOL
//
//  Created by Jini on 2023/08/01.
//

import UIKit

class PaywayVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet

    // MARK: [UI components]
    
    
    let guidelabel: UILabel = {
        let label = UILabel()
        label.text = "결제수단을 등록하시면 \n바로 대여가 가능합니다."
        label.numberOfLines = 0
        label.font = .SB18

        return label
    }()
    
    let registerlabel: UILabel = {
        let label = UILabel()
        label.text = "결제수단 등록"
        label.font = .SB18
        
        return label
    }()
    
    let registerbutton: UIButton = {
        let button = UIButton()
        button.setTitle("결제수단 선택하기", for: .normal)
        button.setDimensions(height: 49, width: 342)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "main")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .SB16
        
        return button
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "결제수단"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(guidelabel)
        view.addSubview(registerlabel)
        view.addSubview(registerbutton)
        
        guidelabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 30)
        registerlabel.anchor(top: guidelabel.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 30)
        registerbutton.anchor(top:registerlabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 30)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}

// MARK: - Extensions



