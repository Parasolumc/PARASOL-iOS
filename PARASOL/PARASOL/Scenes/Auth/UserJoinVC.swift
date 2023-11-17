//
//  UserJoinVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/04.
//

import UIKit

class UserJoinVC : UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // UI
    
    var join: String = ""
    var userType: String = ""
    
    var isNextButtonEnabled = false
    var isAuthButtonEnabled = false
    var isConfirmButtonEnabled = false
    var limitTime : Int = 300
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width
    lazy var screenHeight = bounds.size.height
    
    let joinLabel : UILabel = {
        let label = UILabel()
        label.text = "파라솔과 함께 \n우산을 빌리러 가볼까요?"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 18)
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - 이메일 입력
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
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
        
        return textfield
    }()
    
    let emailLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let emailCheckLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Pretendard-SemiBold", size: 9)
        label.textAlignment = .left
        label.setDimensions(height: 11, width: 342)
        
        return label
    }()
    
    lazy var emailStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailLabel, self.emailTextField, self.emailLineView, self.emailCheckLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 77, width: (screenWidth - 48))
        
        return stackview
    }()
    
    // MARK: - 비밀번호 설정
    
    let pwLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let pwTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "8~12자리 영문, 숫자 조합"
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        
        return textfield
    }()
    
    let pwLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let pwCheckLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Pretendard-SemiBold", size: 9)
        label.textAlignment = .left
        label.setDimensions(height: 11, width: 342)
        
        return label
    }()
    
    lazy var pwStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.pwLabel, self.pwTextField, self.pwLineView, self.pwCheckLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 77, width: (screenWidth - 48))
        
        return stackview
    }()
    
    // MARK: - 비밀번호 확인
    
    let pwcheckLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호 확인"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return label
    }()
    
    let pwcheckTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "8~12자리 영문, 숫자 조합"
        textfield.setPlaceholder(color: UIColor(named: "gray11") ?? .gray)
        textfield.textColor = UIColor(named: "black")
        textfield.textAlignment = .left
        textfield.font = UIFont(name: "Pretendard-Regular", size: 14)
        textfield.borderStyle = .none
        
        return textfield
    }()
    
    let pwcheckLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let pwcheckCheckLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Pretendard-SemiBold", size: 9)
        label.textAlignment = .left
        label.setDimensions(height: 11, width: 342)
        
        return label
    }()
    
    lazy var pwcheckStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.pwcheckLabel, self.pwcheckTextField, self.pwcheckLineView, self.pwcheckCheckLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 77, width: (screenWidth - 48))
        
        return stackview
    }()
    
    // MARK: - 이름 설정
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        
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
        
        return textfield
    }()
    
    let nameLineView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray00")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let nameCheckLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Pretendard-SemiBold", size: 9)
        label.textAlignment = .left
        label.setDimensions(height: 11, width: 342)
        
        return label
    }()
    
    lazy var nameStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.nameLabel, self.nameTextField, self.nameLineView, self.nameCheckLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 13
        stackview.setDimensions(height: 60, width: (screenWidth - 48))
        
        return stackview
    }()
    
    lazy var UserInfoStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.emailStackView, self.pwStackView, self.pwcheckStackView, self.nameStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 23
        stackview.setDimensions(height: 360, width: (screenWidth - 48))
        
        return stackview
    }()
    
    // MARK: - 본인 인증
    
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
        let stackview = UIStackView(arrangedSubviews: [self.phonenumStackView, self.AuthRequestButton])
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
        let stackview = UIStackView()
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
    
    lazy var joinStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.UserInfoStackView, self.authTotalStackView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 40
        stackview.setDimensions(height: 522, width: (screenWidth - 48))
        
        return stackview
    }()
    
    let nextLabel : UILabel = {
        let label = UILabel()
        label.text = "다음"
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var nextButton : UIView = {
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
        postData()
        
        emailTextField.delegate = self
        pwTextField.delegate = self
        pwcheckTextField.delegate = self
        nameTextField.delegate = self
    }
    
    // MARK: - Actions
    
    func setNavigationBar() {
        self.navigationItem.title = "회원가입"
    }
    
    func configureUI() {
        
        view.addSubview(joinLabel)
        view.addSubview(joinStackView)
        view.addSubview(nextButton)
        
        self.emailTextField.autocapitalizationType = .none
        self.pwTextField.autocapitalizationType = .none
        self.pwcheckTextField.autocapitalizationType = .none
        self.nameTextField.autocapitalizationType = .none
        
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailLineView.translatesAutoresizingMaskIntoConstraints = false
        emailCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwLineView.translatesAutoresizingMaskIntoConstraints = false
        pwCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        pwcheckLabel.translatesAutoresizingMaskIntoConstraints = false
        pwcheckTextField.translatesAutoresizingMaskIntoConstraints = false
        pwcheckLineView.translatesAutoresizingMaskIntoConstraints = false
        pwcheckCheckLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameLineView.translatesAutoresizingMaskIntoConstraints = false
        AuthLabel.translatesAutoresizingMaskIntoConstraints = false
        AuthRequestLabel.translatesAutoresizingMaskIntoConstraints = false
        AuthRequestButton.translatesAutoresizingMaskIntoConstraints = false
        phonenumLineView.translatesAutoresizingMaskIntoConstraints = false
        authnumTextField.translatesAutoresizingMaskIntoConstraints = false
        authnumLineView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        joinLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 127, paddingLeft: 24, paddingRight: 192, width: 174, height: 46)
        phonenumTextField.anchor(width: 144, height: 17)
        authnumTextField.anchor(width: 132, height: 17)
        joinStackView.anchor(top: joinLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 36, paddingLeft: 24, paddingRight: 24)
        nextButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 390, height: 72)
    }
    
    @objc func goToLoginVC() {
        let root = LoginVC()
        let vc = UINavigationController(rootViewController: root)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    @objc func nextButtonTapped() {
        
        guard let email = emailTextField.text,
              let password = pwTextField.text,
              let confirmpassword = pwcheckTextField.text,
              let name = nameTextField.text else {
            
            displayAlert(message: "Please fill in all fields.")
            return
        }
        
        if email.isEmpty || password.isEmpty || confirmpassword.isEmpty || name.isEmpty {
            displayAlert(message: "Please fill in all fields.")
            return
        }
        
        if !isValidEmail(email) {
            displayAlert(message: "Invalid email address.")
            return
        }
        
        if !isValidPassword(password) {
            displayAlert(message: "Invalid password.")
        }
        
        if password != confirmpassword {
            displayAlert(message: "Passwords do not match.")
            return
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,12}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func updateAuthButton() {
        if isAuthButtonEnabled {
            // authButton 활성화
            AuthRequestButton.alpha = 1.0
            AuthRequestButton.isUserInteractionEnabled = true
        } else {
            // authButton 비활성화
            AuthRequestButton.alpha = 0.5
            AuthRequestButton.isUserInteractionEnabled = false
            AuthRequestButton.backgroundColor = UIColor(named: "gray00")
        }
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
