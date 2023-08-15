//
//  UserJoinVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/04.
//

import UIKit

class UserJoinVC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var join = "UserJoin"
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let joinLabel : UILabel = {
        let label = UILabel()
        label.text = "파라솔과 함께 \n우산을 빌리러 가볼까요?"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 18)
        label.numberOfLines = 0
        
        return label
    }()
    
    // 이메일 설정
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let emailTextField : UITextField = {
        let emailtf = UITextField()
        emailtf.placeholder = "이메일을 입력하세요."
        emailtf.textColor = UIColor(named: "gray11")
        emailtf.textAlignment = .left
        emailtf.font = UIFont(name: "Pretendard-Regular", size: 14)
        emailtf.borderStyle = .none
        
        return emailtf
    }()
    
    let emailLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    // 이메일 입력 스택 뷰
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailLabel, self.emailTextField, self.emailLineView])
        
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
    
    // 비밀번호 설정
    let pwLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let pwTextField : UITextField = {
        let pwtf = UITextField()
        pwtf.placeholder = "8~12자리 영문, 숫자 조합"
        pwtf.textColor = UIColor(named: "gray")
        pwtf.textAlignment = .left
        pwtf.font = UIFont(name: "Pretendard-Regular", size: 14)
        pwtf.borderStyle = .none
        
        return pwtf
    }()
    
    let pwLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    // 비밀번호 설정 스택 뷰
    lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.pwLabel, self.pwTextField, self.pwLineView])
        
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
    
    let pwcheckLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호 확인"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let pwcheckTextField : UITextField = {
        let pwchecktf = UITextField()
        pwchecktf.placeholder = "8~12자리 영문, 숫자 조합"
        pwchecktf.textColor = UIColor(named: "gray11")
        pwchecktf.textAlignment = .left
        pwchecktf.font = UIFont(name: "Pretendard-Regular", size: 14)
        pwchecktf.borderStyle = .none
        
        return pwchecktf
    }()
    
    let pwcheckLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    // 비밀번호 확인 스택 뷰
    lazy var pwcheckStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.pwcheckLabel, self.pwcheckTextField, self.pwcheckLineView])
        
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
    
    // 이름 설정
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let nameTextField : UITextField = {
        let nametf = UITextField()
        nametf.placeholder = "이름을 입력하세요."
        nametf.textColor = UIColor(named: "gray11")
        nametf.textAlignment = .left
        nametf.font = UIFont(name: "Pretendard-Regular", size: 14)
        nametf.borderStyle = .none
        
        return nametf
    }()
    
    let nameLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    // 이름 입력 스택 뷰
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.nameTextField, self.nameLineView])
        
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
    
    // 인증
    
    let phoneauthLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대폰 인증"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        
        return label
    }()
    
    let phonenumTextField: UITextField = {
        let phonenumtf = UITextField()
        phonenumtf.placeholder = "휴대폰 번호를 입력하세요."
        phonenumtf.textColor = UIColor(named: "gray")
        phonenumtf.borderStyle = .none
        phonenumtf.textAlignment = .left
        phonenumtf.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        return phonenumtf
    }()
    
    let authLabel: UILabel = {
        var label = UILabel()
        label.text = "인증요청"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var authButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 84).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view.layer.cornerRadius = 17
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(authLabel)
        authLabel.centerX(inView: view)
        authLabel.centerY(inView: view)
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    let phonenumLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    // 휴대폰 입력 칸 스택 뷰 : [휴대폰 번호 입력 - 인증요청 버튼]
    lazy var phonenumStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.phonenumTextField, self.authButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 113
        stackView.setDimensions(height: 34, width: (screenWidth - 49)) // 스택뷰 사이즈 설정
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let authnumTextField: UITextField = {
        let authnumtf = UITextField()
        authnumtf.placeholder = "인증 번호를 입력하세요."
        authnumtf.textColor = UIColor(named: "gray11")
        authnumtf.textAlignment = .left
        authnumtf.font = UIFont(name: "Pretendard-Regular", size: 14)
        authnumtf.borderStyle = .none
        
        return authnumtf
    }()
    
    let authnumLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "05:00"
        label.textColor = UIColor(named: "red")
        label.backgroundColor = .clear
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let confirmLabel: UILabel = {
        var label = UILabel()
        
        label.text = "확인"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = .black
        
        return label
    }()
    
    lazy var confirmButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 84).isActive = true
        view.heightAnchor.constraint(equalToConstant: 34).isActive = true
        view.layer.cornerRadius = 17
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(confirmLabel)
        confirmLabel.centerX(inView: view)
        confirmLabel.centerY(inView: view)
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    lazy var labelNbtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.timeLabel, self.confirmButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        // 요소간 간격 조정
        stackView.spacing = 10
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 34, width: 135)
        stackView.alignment = .center
        
        return stackView
    }()
    
    lazy var authInputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authnumTextField, self.labelNbtnStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        // 요소간 간격 조정
        stackView.spacing = 74
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 43, width: (screenWidth - 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authnumStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.phonenumStackView, self.phonenumLineView, self.authInputStackView, self.authnumLineView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        // 요소간 간격 조정
        stackView.spacing = 7
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 90, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.phoneauthLabel, self.authnumStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        // 요소간 간격 조정
        stackView.spacing = 15
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 122, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var joinStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailStackView, self.pwStackView, self.pwcheckStackView, self.nameStackView, self.authStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 40
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 522, width: (screenWidth - 48))
        
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
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToUserPaymentVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
        postData()
    }
    
    func setNavigationBar() {
            self.navigationItem.title = "회원가입"
        }
    
    func configureUI() {
        
        
        view.addSubview(joinLabel)
        view.addSubview(joinStackView)
        view.addSubview(nextButton)
        
        self.emailTextField.autocapitalizationType = .none
        self.pwTextField.autocapitalizationType = .none
        
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailLineView.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwLineView.translatesAutoresizingMaskIntoConstraints = false
        pwcheckLabel.translatesAutoresizingMaskIntoConstraints = false
        pwcheckTextField.translatesAutoresizingMaskIntoConstraints = false
        pwcheckLineView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameLineView.translatesAutoresizingMaskIntoConstraints = false
        phoneauthLabel.translatesAutoresizingMaskIntoConstraints = false
        phonenumTextField.translatesAutoresizingMaskIntoConstraints = false
        authLabel.translatesAutoresizingMaskIntoConstraints = false
        authButton.translatesAutoresizingMaskIntoConstraints = false
        phonenumLineView.translatesAutoresizingMaskIntoConstraints = false
        authnumTextField.translatesAutoresizingMaskIntoConstraints = false
        authnumLineView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        
        joinLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 127, paddingLeft: 24, paddingRight: 192, width: 174, height: 46)
        phonenumTextField.anchor(width: 144, height: 17)
        authnumTextField.anchor(width: 132, height: 17)
        joinStackView.anchor(top: joinLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 36, paddingLeft: 24, paddingRight: 24)
        nextButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 390, height: 72)
    }
    
    @objc func goToUserPaymentVC() {
        let userpaymentVC = UserPaymentVC()
        userpaymentVC.payment = "UserPayment"
        self.navigationController?.pushViewController(userpaymentVC, animated: true)
    }


// MARK: - Helpers
    
    func postData() {
        let userNickname : UserJoinModel = UserJoinModel(nickname: "joo", email: "joo@gmail.com", password: "1234")
        AuthManager.shared.userJoin(userJoinData: userNickname) { result in
            switch result {
            case .success(let data) :
                if data["check"] as? Bool == true {
                    print("회원가입에 성공했습니다.\n")
                }
            case .failure(let error):
                print(error)
                return
            }
        }
        
        let verify: VerifyModel = VerifyModel(name: "", email: "", phoneNumber: "")
        AuthManager.shared.verify(verifyData: verify) { result in
            switch result {
            case .success(let data) :
                if data["check"] as? Bool == true {
                    print("인증번호를 전송했습니다.")
                }
            case .failure(_):
                print("인증번호를 전송하지 못했습니다.")
            }
        }
        
        let verifyCheck: VerifyCheckModel = VerifyCheckModel(code: "201023", phoneNumber: "010-1234-1234")
        AuthManager.shared.verifyCheck(verifyCheckData: verifyCheck) { result in
            switch result {
            case .success(let data) :
                if data["check"] as? Bool == true {
                    print("인증 완료")
                }
            case .failure(let Error) :
                print(Error)
                return
            }
        }
    }
}
