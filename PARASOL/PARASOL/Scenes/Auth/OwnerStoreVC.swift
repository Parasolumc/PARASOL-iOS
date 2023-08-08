//
//  StoreInfoVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/08.
//

import UIKit

class OwnerStoreVC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var signUp = "OwnerStore"
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let storeNameLabel : UILabel = {
        let label = UILabel()
        label.text = "매장명"
        label.textColor = UIColor(named:"black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let storeNameTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "매장명을 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.textAlignment = .left
        textfield.borderStyle = .none

        return textfield
    }()
    
    let storeNameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    lazy var storeNameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.storeNameLabel, self.storeNameTextField, self.storeNameLineView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 60, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.text = "위치 찾기"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .left
        
        return label
    }()
    
    let locationBoxView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setDimensions(height: 42, width: 342)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    lazy var locationStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.locationLabel, self.locationBoxView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 72, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let addressTextfield : UITextField = {
        let addtextfield = UITextField()
        addtextfield.placeholder = "상세주소를 입력하세요."
        addtextfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        addtextfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        addtextfield.textAlignment = .left
        addtextfield.borderStyle = .none
        
        return addtextfield
    }()
    
    let addressLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    lazy var addressStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.addressTextfield, self.addressLineView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 30, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
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
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        
        view.addSubview(storeNameStackView)
        view.addSubview(locationStackView)
        view.addSubview(addressStackView)
        view.addSubview(nextButton)
        
        self.storeNameTextField.autocapitalizationType = .none
        self.addressTextfield.autocapitalizationType = .none
        
        storeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        storeNameLineView.translatesAutoresizingMaskIntoConstraints = false
        storeNameTextField.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationBoxView.translatesAutoresizingMaskIntoConstraints = false
        addressTextfield.translatesAutoresizingMaskIntoConstraints = false
        addressLineView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        
        storeNameStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom : locationStackView.bottomAnchor, right: view.rightAnchor, paddingTop: 132, paddingLeft: 24, paddingBottom: 40, paddingRight: 24)
        locationStackView.anchor(top: storeNameStackView.bottomAnchor, left: view.leftAnchor, bottom: addressStackView.topAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 24, paddingBottom: 25, paddingRight: 24)
        addressStackView.anchor(top: locationStackView.bottomAnchor, left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 24, paddingBottom: 413, paddingRight: 24)
        nextButton.anchor(top: addressStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 413, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 390, height: 72)
    }
}
