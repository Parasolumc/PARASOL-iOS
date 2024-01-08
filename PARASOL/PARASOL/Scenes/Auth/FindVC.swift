//
//  FindVC.swift
//  PARASOL
//
//  Created by 서주영 on 2024/01/07.
//

import UIKit

class FindVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width
    lazy var screenHeight = bounds.size.height
    
    let findIDBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("아이디 찾기", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 64, width: 195)
        btn.backgroundColor = UIColor(named: "white")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    let findPWBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("비밀번호 재설정", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 64, width: 195)
        btn.backgroundColor = UIColor(named: "white")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    lazy var findBtnStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.findIDBtn, self.findPWBtn])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        stackview.spacing = 0
        stackview.setDimensions(height: 64, width: 390)
        
        return stackview
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.setDimensions(height: 17, width: 25)
        
        return label
    }()
    
    let nameTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "이름을 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        textfield.autocapitalizationType = .none
        
        return textfield
    }()
    
    let nameLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    lazy var nameStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.nameLabel, self.nameTextField, self.nameLineView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 61, width: (screenWidth - 48))
        
        return stackview
    }()
    
    // 비밀번호 찾기에 사용
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.setDimensions(height: 17, width: 25)
        
        return label
    }()
    
    let emailTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "이메일을 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        textfield.autocapitalizationType = .none
        
        return textfield
    }()
    
    let emailLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    lazy var emailStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailLabel, self.emailTextField, self.emailLineView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 61, width: (screenWidth - 48))
        
        return stackview
    }()
    
    let AuthLabel : UILabel = {
        let label = UILabel()
        label.text = "휴대폰 인증"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let phonenumTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "휴대폰 번호를 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        
        return textfield
    }()
    
    let AuthRequestLabel : UILabel = {
        let label = UILabel()
        label.text = "인증요청"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var AuthRequestButton : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 84).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view.layer.cornerRadius = 17
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(AuthRequestLabel)
        AuthRequestLabel.centerX(inView: view)
        AuthRequestLabel.centerY(inView: view)
        
        return view
    }()
    
    let phonenumLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    lazy var phonenumStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.phonenumTextField, self.AuthRequestButton])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        stackview.spacing = 113
        stackview.setDimensions(height: 34, width: (screenWidth - 49))
        
        return stackview
    }()
    
    let authnumTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "인증 번호를 입력하세요."
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        
        return textfield
    }()
    
    let authnumLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let timeLabel : UILabel = {
        let label = UILabel()
        label.text = "05:00"
        label.textColor = UIColor(named: "red")
        label.backgroundColor = .clear
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let confirmLabel : UILabel = {
        let label = UILabel()
        label.text = "확인"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var confirmButton : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 84).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view.layer.cornerRadius = 17
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(confirmLabel)
        confirmLabel.centerX(inView: view)
        confirmLabel.centerY(inView: view)
        
        /* view.isUserInteractionEnabled = true
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextButtonActive))
         view.addGestureRecognizer(tapGesture) */
        
        return view
    }()
    
    lazy var StackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.timeLabel, self.confirmButton])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .equalCentering
        stackview.spacing = 10
        stackview.setDimensions(height: 34, width: 135)
        stackview.alignment = .center
        
        return stackview
    }()
    
    lazy var authnumStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.authnumTextField, self.StackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .equalCentering
        stackview.spacing = 74
        stackview.setDimensions(height: 43, width: (screenWidth - 50))
        
        return stackview
    }()
    
    lazy var authStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.phonenumStackView, self.phonenumLineView, self.authnumStackView, self.authnumLineView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalCentering
        stackview.spacing = 7
        stackview.setDimensions(height: 90, width: (screenWidth - 48))
        
        return stackview
    }()
    
    lazy var authTotalStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.AuthLabel, self.authStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalCentering
        stackview.spacing = 15
        stackview.setDimensions(height: 122, width: (screenWidth - 48))
        
        return stackview
    }()
    
    lazy var findIDStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.nameStackView, self.authTotalStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalCentering
        stackview.spacing = 15
        stackview.setDimensions(height: 122, width: (screenWidth - 48))
        
        return stackview
    }()
    
    lazy var findPWStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.nameStackView, self.emailStackView, self.authTotalStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalCentering
        stackview.spacing = 15
        stackview.setDimensions(height: 320, width: (screenWidth - 48))
        
        return stackview
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 72, width: 390)
        btn.backgroundColor = UIColor(named: "gray00")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configureUI()
        
        findIDBtn.addTarget(self, action: #selector(findIDBtnTapped), for: .touchUpInside)
        findPWBtn.addTarget(self, action: #selector(findPWBtnTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "ID/PW 찾기"
        
    }
    
    func configureUI() {
        self.view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(findBtnStackView)
        view.addSubview(nextButton)
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameLineView.translatesAutoresizingMaskIntoConstraints = false
        AuthLabel.translatesAutoresizingMaskIntoConstraints = false
        phonenumTextField.translatesAutoresizingMaskIntoConstraints = false
        AuthRequestLabel.translatesAutoresizingMaskIntoConstraints = false
        AuthRequestButton.translatesAutoresizingMaskIntoConstraints = false
        phonenumLineView.translatesAutoresizingMaskIntoConstraints = false
        authnumTextField.translatesAutoresizingMaskIntoConstraints = false
        authnumLineView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        findBtnStackView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 101.76, paddingLeft: 0, paddingRight: 0)
        findIDStackView.anchor(top: findBtnStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 24, paddingRight: 24)
        nextButton.anchor(top: authTotalStackView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 317, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    @objc func findIDBtnTapped() {
        // 이전에 선택된 버튼을 선택 해제
        deselectButton(selectedBtn: findPWBtn)

        // 현재 버튼을 선택
        let selectedBtn = findIDBtn
        addUnderlineToButton(button: selectedBtn)
        
        // authTotalStackView에 있는 기존 서브뷰들 제거
        findPWStackView.subviews.forEach { $0.removeFromSuperview() }

        // 새로운 서브뷰 추가
        authTotalStackView.addArrangedSubview(findIDStackView)
    }

    @objc func findPWBtnTapped() {
        // 이전에 선택된 버튼을 선택 해제
        deselectButton(selectedBtn: findIDBtn)

        // 현재 버튼을 선택
        let selectedBtn = findPWBtn
        addUnderlineToButton(button: selectedBtn)
        
        // authTotalStackView에 있는 기존 서브뷰들 제거
        findIDStackView.subviews.forEach { $0.removeFromSuperview() }

        // 새로운 서브뷰 추가
        authTotalStackView.addArrangedSubview(findPWStackView)
    }

    // 버튼에 밑줄 추가하는 도우미 메서드
    private func addUnderlineToButton(button: UIButton) {
        let underlineView = UIView()
        underlineView.backgroundColor = UIColor(named: "main")
        button.addSubview(underlineView)
        underlineView.anchor(bottom: button.bottomAnchor, paddingBottom: 1, width: 195, height: 1)
    }

    // 버튼을 선택 해제하는 도우미 메서드
    private func deselectButton(selectedBtn: UIButton?) {
        // 버튼이 nil 인지 확인 (선택된 버튼이 없는 경우)
        guard let selectedBtn = selectedBtn else { return }

        // 이전에 선택된 버튼에서 밑줄 뷰 제거
        selectedBtn.subviews.forEach { $0.removeFromSuperview() }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}

