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
    var money: String = ""
    
    lazy var guidelabel: UILabel = {
        let label = UILabel()
        label.text = "미납된 연체료는 총 \(money)입니다."
        label.numberOfLines = 0
        label.font = .SB18
        label.textColor = UIColor(named: "black")

        return label
    }()
    
    let registerlabel: UILabel = {
        let label = UILabel()
        label.text = "결제하기"
        label.font = .SB18
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var registerbutton: UIButton = {
        let button = UIButton()
        button.setTitle("파라솔페이로 결제하기", for: .normal)
        button.setDimensions(height: 49, width: 342)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "main")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .SB16
        
        let goTopaymentVCAction = UIAction { _ in
            let payVC = PaymentWidgetVC()
            self.navigationController?.pushViewController(payVC, animated: true)
        }
        
        button.addAction(goTopaymentVCAction, for: .touchUpInside)
        
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
        self.navigationItem.title = "연체료 결제"
        // 네비게이션바 폰트 및 색상 설정
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "black")!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!]
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(guidelabel)
        view.addSubview(registerlabel)
        view.addSubview(registerbutton)
        
        guidelabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 30)
        registerlabel.anchor(top: guidelabel.bottomAnchor, left: view.leftAnchor, paddingTop: 60, paddingLeft: 30)
        registerbutton.anchor(top:registerlabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 30)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}

// MARK: - Extensions



