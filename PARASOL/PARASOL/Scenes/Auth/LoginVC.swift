//
//  LoginVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit
import Toast_Swift
import AuthenticationServices // 애플 로그인

class LoginVC: UIViewController {
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    // 토스트 메세지 스타일
    var style: ToastStyle = {
        var style =  ToastStyle()
        
        style.backgroundColor = UIColor(named: "gray22_opacity")!
        style.messageFont = .M14!
        
        return style
    }()
    
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 203.18, height: 78.40195))
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let idTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디 (이메일)"
        textField.borderStyle = .none
        textField.textAlignment = .left
        textField.textColor = UIColor(named: "black")
        textField.setPlaceholder(color: UIColor(named: "gray22") ?? .gray)
        textField.font = UIFont(name: "Pretendard-Medium", size: 14)

        
        return textField
    }()
    
    let idLineView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "gray22")
            view.setDimensions(height: 1, width: 250)
            
            return view
        }()
    
    let pwTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
        textField.textAlignment = .left
        textField.textColor = UIColor(named: "black")
        textField.setPlaceholder(color: UIColor(named: "gray22") ?? .gray)
        textField.font = UIFont(name: "Pretendard-Medium", size: 14)
        
        return textField
    }()
    
    let pwLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray22")
        view.setDimensions(height: 1, width: 250)
        
        return view
    }()
    
    lazy var idtfStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.idTextField, self.idLineView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical // :수직, .horizontial: 수평
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 30, width: (screenWidth - 140))
        
        return stackView
    }()
    
    lazy var pwtfStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.pwTextField, self.pwLineView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical // :수직, .horizontial: 수평
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 13
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 30, width: (screenWidth - 140))
        
        return stackView
    }()

    lazy var idpwtfStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.idtfStackView, self.pwtfStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical // :수직, .horizontial: 수평
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 35
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 95, width: (screenWidth - 140))
        
        return stackView
    }()
    
    let loginLabel: UILabel = {
        var label = UILabel()
        
        label.text = "로그인"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var loginButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 250).isActive = true
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "point")
        view.addSubview(loginLabel)
        loginLabel.centerX(inView: view)
        loginLabel.centerY(inView: view)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doLogin))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    let findButton : UIButton = {
        let findbtn = UIButton()
        findbtn.setTitle("ID/PW 찾기", for: .normal)
        findbtn.setTitleColor(UIColor(named: "gray22"), for: .normal)
        findbtn.titleLabel?.font = .systemFont(ofSize: 16)
        findbtn.backgroundColor = .clear
        
        return findbtn
    }()
    
    let joinButton : UIButton = {
        let joinbtn = UIButton(type: .custom)
        joinbtn.setTitle("회원가입", for: .normal)
        joinbtn.setTitleColor(UIColor(named: "gray22"), for: .normal)
        joinbtn.titleLabel?.font = .systemFont(ofSize: 16)
        joinbtn.backgroundColor = .clear
        
        return joinbtn
    }()
    
    lazy var fndjoinStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.findButton, self.joinButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal // :수직, .horizontial: 수평
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 59
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 19, width: (screenWidth - 196))
        stackView.alignment = .center
        
        return stackView
    }()
    
    let separatorLineView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray22")
        view.setDimensions(height: 1, width: 90)
        
        return view
    }()
    
    let separatorLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray22")
        view.setDimensions(height: 1, width: 90)
        
        return view
    }()
    
    let orLabel : UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textColor = UIColor(named: "gray22")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var orStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.separatorLineView1, self.orLabel, self.separatorLineView2])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        // 요소간 간격 조정
        stackView.spacing = 20
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 17, width: 250)
        stackView.alignment = .center
        
        return stackView
    }()
    
//    let kakaoLoginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "message.circle.fill"), for: .normal)
//        button.backgroundColor = .yellow
//
//        return button
//    }()
    
    lazy var appleLoginButton:UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "apple_login"), for: .normal)
        button.setDimensions(height: 54, width: 54)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 45 / 2
        button.clipsToBounds = true
        
        let appleLoginAction = UIAction { _ in
            self.doAppleLogin()
        }
        button.addAction(appleLoginAction, for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        buttonActionUI()
        
    }
    
    // MARK: - Actions
    func buttonActionUI() {
        
        // 회원가입 버튼
        let goToselectVCAction = UIAction {[weak self] _ in
            guard let self = self else { return }
            let selectVC = SelectVC()
            self.navigationController?.pushViewController(selectVC, animated: true)
        }
        
        joinButton.addAction(goToselectVCAction, for: .touchUpInside)
        
        // ID/PW 찾기 버튼
        let goTofindVCAction = UIAction {[weak self] _ in
            guard let self = self else { return }
            let findVC = FindVC()
            self.navigationController?.pushViewController(findVC, animated: true)
        }
        
        findButton.addAction(goTofindVCAction, for: .touchUpInside)
    }
    
    @objc func doLogin() {
        print("로그인 버튼 누름")
        if idTextField.text != ""  && pwTextField.text != "" {
            login(userID: idTextField.text ?? "", userPW: pwTextField.text ?? "")
        } else {
            if idTextField.text == "" && pwTextField.text == "" {
                self.view.makeToast("아이디와 비밀번호를 입력하세요.", duration: 1.0, position: .center, style: self.style)
            } else if idTextField.text == "" {
                self.view.makeToast("아이디를 입력하세요.", duration: 1.0, position: .center, style: self.style)
            } else if pwTextField.text == "" {
                self.view.makeToast("비밀번호를 입력하세요.", duration: 1.0, position: .center, style: self.style)
            } else {
                self.view.makeToast("일치하는 회원정보가 없습니다.", duration: 1.0, position: .center, style: self.style)
            }
        }
        
    }
    
    // 홈 화면으로 이동
    func goToHome(at: String) {
        if at == "CUSTOMER" {
            let vc = UserTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        } else if at == "OWNER" {
            let vc = OwnerTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        } else {
            self.view.makeToast("앱 접속 실패", duration: 1.0, position: .center, style: self.style)
        }
        
    }
    
    func configureUI() {
        
        view.addSubview(logoImageView)
        view.addSubview(idtfStackView)
        view.addSubview(pwtfStackView)
        view.addSubview(idpwtfStackView)
        view.addSubview(loginButton)
        view.addSubview(fndjoinStackView)
        view.addSubview(orStackView)
//        view.addSubview(kakaoLoginButton)
        view.addSubview(appleLoginButton)
        
        self.idTextField.autocapitalizationType = .none
        self.pwTextField.autocapitalizationType = .none
        
        self.view.backgroundColor = UIColor(named: "main")
        
        logoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 237, paddingLeft: 93, paddingRight: 93.82)
        
        idpwtfStackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 106.6, paddingLeft: 70, paddingRight: 70)
                                
        loginButton.anchor(top: idpwtfStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 31, paddingLeft: 70, paddingRight: 70)
        loginButton.centerX(inView: view.self)
        loginButton.backgroundColor = UIColor(named: "point")
        
        fndjoinStackView.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 98, paddingRight: 99)
        
        orStackView.anchor(top: fndjoinStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 70, paddingRight: 70)
        
//        kakaoLoginButton.anchor(top: orStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 724, paddingLeft: 122)
        appleLoginButton.anchor(top: orStackView.bottomAnchor, paddingTop: 28)
        appleLoginButton.centerX(inView: view)
    }
    
    // MARK: - Helpers
    
    // 로그인 서버 통신
    func login(userID: String, userPW: String) {
        let loginData: LoginModel = LoginModel(email: userID, password: userPW)
        AuthManager.shared.doLogin(loginData: loginData) { result in
            switch result {
            case .success(let data):
                print(data)
                if data["check"] as? Bool == true {
                    self.sendFcmToken(fcmToken: UserDefaults.standard.value(forKey: "fcmToken") as! String)
                    self.goToHome(at: UserDefaults.standard.value(forKey: "role") as! String)
                } else if data["check"] as? Bool == false {
                    self.view.makeToast("로그인 실패", duration: 1.0, position: .center, style: self.style)
                }
            case .failure(let error):
                print("로그인 에러")
                print(error)
                self.view.makeToast("로그인 실패", duration: 1.0, position: .center, style: self.style)
            }
        }
    }
    
    // 푸쉬 알림 통신
    func sendFcmToken(fcmToken: String) {
        let param: PushAlarmModel = PushAlarmModel(fcmToken: fcmToken)
        AlarmManager.shared.sendFcmToken(param: param) { result in
            switch result {
            case .success(let response):
                print("fcm 토큰 업데이트 서버 통신 성공: \(response)")
            case .failure(let error):
                print("fcm 토큰 업데이트 서버 통신 실페: \(error)")
            }
            
        }
    }
}

// 애플 로그인
extension LoginVC: ASAuthorizationControllerDelegate {
//, ASAuthorizationControllerPresentationContextProviding {

//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        <#code#>
//    }


    // 애플 로그인 버튼 클릭시 실행되는 함수
    func doAppleLogin() {
        print("애플 로그인 버튼 클릭")
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

