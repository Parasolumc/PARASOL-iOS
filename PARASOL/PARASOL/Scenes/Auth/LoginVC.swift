//
//  LoginVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit

class LoginVC: UIViewController {
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
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
        textField.textColor = UIColor(named: "gray22")
        textField.font = .systemFont(ofSize: 14)

        
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
        textField.textColor = UIColor(named: "gray22")
        textField.font = .systemFont(ofSize: 14)
        
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
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
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
    
    let socialLoginLabel: UILabel = {
        let label = UILabel()
        label.text = "소셜로그인 추가 예정"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "gray11")
        
        return label
    }()
    
//    let kakaoLoginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "message.circle.fill"), for: .normal)
//        button.backgroundColor = .yellow
//
//        return button
//    }()
    
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
    }
    
    func configureUI() {
        
        view.addSubview(logoImageView)
        view.addSubview(idtfStackView)
        view.addSubview(pwtfStackView)
        view.addSubview(idpwtfStackView)
        view.addSubview(loginButton)
        view.addSubview(fndjoinStackView)
        view.addSubview(orStackView)
        view.addSubview(socialLoginLabel)
//        view.addSubview(kakaoLoginButton)
        
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        idLineView.translatesAutoresizingMaskIntoConstraints = false
        pwLineView.translatesAutoresizingMaskIntoConstraints = false
        idtfStackView.translatesAutoresizingMaskIntoConstraints = false
        pwtfStackView.translatesAutoresizingMaskIntoConstraints = false
        idpwtfStackView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        fndjoinStackView.translatesAutoresizingMaskIntoConstraints = false
        orStackView.translatesAutoresizingMaskIntoConstraints = false
        socialLoginLabel.translatesAutoresizingMaskIntoConstraints = false
//        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "main")
        
        logoImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 237, paddingLeft: 93, paddingRight: 93.82)
        
        idpwtfStackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 106.6, paddingLeft: 70, paddingRight: 70)
                                
        loginButton.anchor(top: idpwtfStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 31, paddingLeft: 70, paddingRight: 70)
        loginButton.centerX(inView: view.self)
        loginButton.backgroundColor = UIColor(named: "point")
        
        fndjoinStackView.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 98, paddingRight: 99)
        
        orStackView.anchor(top: fndjoinStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 70, paddingRight: 70)
        
        socialLoginLabel.anchor(top: orStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 35, paddingLeft: 122, paddingRight: 122)
        
//        kakaoLoginButton.anchor(top: orStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 724, paddingLeft: 122)
        
    }
    
    // MARK: - Helpers
}


