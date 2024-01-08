//
//  OwnerStoreVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/08.
//

import UIKit

class OwnerStoreVC : UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var signUp = "OwnerStore"
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 화면 구성
    
    let storeNameLabel : UILabel = {
        let label = UILabel()
        label.text = "매장명"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .left
        label.anchor(width: 37, height: 17)
        
        return label
    }()
    
    let storeNameTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "매장명을 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.textAlignment = .left
        textfield.anchor(width: 116, height: 19 )
        
        return textfield
    }()
    
    let storeNameLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 2, width: 342)
        
        return view
    }()
    
    lazy var storeNameStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.storeNameLabel, self.storeNameTextField, self.storeNameLineView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 60, width: (screenWidth - 48))
        
        return stackView
    }()
    
    let locaLabel : UILabel = {
        let label = UILabel()
        label.text = "위치 찾기"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let locaTextLabel : UILabel = {
        let label = UILabel()
        label.text = "지번, 도로명, 건물명으로 검색"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "gray11")
        label.textAlignment = .left
        
        return label
    }()

    lazy var locaSearchButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        button.setDimensions(height: 22, width: 22)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 22 / 2
        button.clipsToBounds = true
        
        return button
    }()
    
    let locaSearchView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.widthAnchor.constraint(equalToConstant: 84).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor(named: "gray00")?.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    let addressTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "상세주소를 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        return textfield
    }()
    
    let addressLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 2, width: 342)
        
        return view
    }()
    
    lazy var addressStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.addressTextField, self.addressLineView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 30, width: (screenWidth - 48))
        
        return stackView
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("완료", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 72, width: 390)
        btn.clipsToBounds = true
        
        return btn
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
        
        storeNameTextField.delegate = self
        addressTextField.delegate = self
        nextButtonActivated()
        
        locaSearchButton.addTarget(self, action: #selector(goToAddressSearchVC), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(goToLoginVC), for: .touchUpInside)
    }
    
    // MARK: - Actions
    func setNavigationBar() {
            self.navigationItem.title = "매장정보 등록"
        }
    
    func configureUI() {
        
        view.addSubview(storeNameLabel)
        view.addSubview(storeNameTextField)
        view.addSubview(storeNameLineView)
        view.addSubview(storeNameStackView)
        view.addSubview(locaLabel)
        view.addSubview(locaSearchView)
        view.addSubview(locaTextLabel)
        view.addSubview(locaSearchButton)
        view.addSubview(addressTextField)
        view.addSubview(addressLineView)
        view.addSubview(addressStackView)
        view.addSubview(nextButton)
        
        self.storeNameTextField.autocapitalizationType = .none
        self.addressTextField.autocapitalizationType = .none
        
        storeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        storeNameTextField.translatesAutoresizingMaskIntoConstraints = false
        storeNameLineView.translatesAutoresizingMaskIntoConstraints = false
        locaLabel.translatesAutoresizingMaskIntoConstraints = false
        locaSearchView.translatesAutoresizingMaskIntoConstraints = false
        locaTextLabel.translatesAutoresizingMaskIntoConstraints = false
        locaSearchButton.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        addressLineView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        storeNameStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: locaLabel.topAnchor, right: view.rightAnchor, paddingTop: 132, paddingLeft: 24, paddingBottom: 40, paddingRight: 24)
        locaLabel.anchor(top: storeNameStackView.bottomAnchor, left: view.leftAnchor, bottom: locaSearchView.topAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 24, paddingBottom: 13, paddingRight: 314)
        locaSearchView.anchor(top: locaLabel.bottomAnchor, left: view.leftAnchor, bottom: addressTextField.topAnchor, right: view.rightAnchor, paddingTop: 13, paddingLeft: 24, paddingBottom: 25, paddingRight: 24)
        locaTextLabel.anchor(top: locaSearchView.topAnchor, left: locaSearchView.leftAnchor, bottom: locaSearchView.bottomAnchor, right: locaSearchButton.leftAnchor, paddingTop: 12, paddingLeft: 9, paddingBottom: 13, paddingRight: 138)
        locaSearchButton.anchor(top: locaSearchView.topAnchor, left: locaTextLabel.rightAnchor, bottom: locaSearchView.bottomAnchor, right: locaSearchView.rightAnchor, paddingTop: 10, paddingLeft: 138, paddingBottom: 10, paddingRight: 10)
        addressStackView.anchor(top: locaSearchView.bottomAnchor, left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 24, paddingBottom: 413, paddingRight: 24)
        nextButton.anchor(top: addressStackView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 413, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    @objc func goToAddressSearchVC() {
        let addsearchVC = AddressSearchVC()
        addsearchVC.onAddressSelect = { [weak self] selectedAddress in
            // 주소를 받아 처리
            self?.locaTextLabel.text = selectedAddress
            self?.locaTextLabel.textColor = UIColor(named: "black")
        }
        
        navigationController?.pushViewController(addsearchVC, animated: true)
    }
    
    @objc func goToLoginVC() {
        let loginVC = LoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    func nextButtonActivated() {
        if let storename = storeNameTextField.text, !storename.isEmpty,
           let moreaddress = addressTextField.text, !moreaddress.isEmpty,
           locaTextLabel.textColor == UIColor(named: "black") {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(named: "main")
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = UIColor(named: "gray00")
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == storeNameTextField {
            nextButtonActivated()
        } else if textField == locaTextLabel {
            nextButtonActivated()
        } else if textField == addressTextField {
            nextButtonActivated()
        }
    }
    
    // MARK: - Helpers
}
