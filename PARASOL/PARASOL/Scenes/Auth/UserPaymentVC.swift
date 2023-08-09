//
//  UserPaymentVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/09.
//

import UIKit

class UserPaymentVC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var payment = "UserPayment"
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 화면 구성
    
    let paymentLabel: UILabel = {
        var label = UILabel()
        label.text = "결제수단 선택하기"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var paymentButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 342).isActive = true
        view.heightAnchor.constraint(equalToConstant: 58.07207).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(paymentLabel)
        paymentLabel.centerX(inView: view)
        paymentLabel.centerY(inView: view)
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    let laterLabel: UILabel = {
        var label = UILabel()
        label.text = "나중에 등록하기"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var laterButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 89).isActive = true
        view.heightAnchor.constraint(equalToConstant: 17).isActive = true
        view.layer.cornerRadius = 0
        view.backgroundColor = .clear
        view.addSubview(laterLabel)
        laterLabel.centerX(inView: view)
        laterLabel.centerY(inView: view)
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    let nextLabel: UILabel = {
        var label = UILabel()
        
        label.text = "다음"
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    lazy var nextButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 390).isActive = true
        view.heightAnchor.constraint(equalToConstant: 72).isActive = true
        view.layer.cornerRadius = 0
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(nextLabel)
        nextLabel.centerX(inView: view)
        nextLabel.centerY(inView: view)
        
//        view.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerStoreVC))
//        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    
    func setNavigationBar() {
            self.navigationItem.title = "결제수단 등록"
        }
    
    func configureUI() {
        
        view.addSubview(paymentButton)
        view.addSubview(laterButton)
        view.addSubview(nextButton)
        
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentButton.translatesAutoresizingMaskIntoConstraints = false
        laterLabel.translatesAutoresizingMaskIntoConstraints = false
        laterButton.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        paymentButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: laterButton.topAnchor, right: view.rightAnchor, paddingTop: 132, paddingLeft: 24, paddingBottom: 29.93, paddingRight: 24)
        
        laterButton.anchor(top: paymentButton.bottomAnchor, left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, paddingTop: 29.93, paddingLeft: 151, paddingBottom: 535, paddingRight: 150)
        
        nextButton.anchor(top: laterButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 535, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 390, height: 72)
    
    }
    
    // MARK: - Helpers
}

