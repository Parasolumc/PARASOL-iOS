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

    let logoImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        
        return imageView
    }()
    
    let idTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디 (이메일)"
        textField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1, width: textField.frame.width, height: 1)
        if let uiColor = UIColor(named: "darkgray") {
            border.backgroundColor = uiColor.cgColor
        }
        textField.layer.addSublayer((border))
        textField.textAlignment = .center
        textField.textColor = UIColor(named: "darkgray")
        
        return textField
    }()
    
    let pwTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-1, width: textField.frame.width, height: 1)
        if let uiColor = UIColor(named: "darkgray") {
            border.backgroundColor = uiColor.cgColor
        }
        textField.layer.addSublayer((border))
        textField.textAlignment = .center
        textField.textColor = UIColor(named: "darkgray")
        
        return textField
    }()
    
    lazy var idpwTFStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.idTextField, self.pwTextField])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical // :수직, .horizontial: 수평
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 35
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 95, width: (screenWidth - 140))
        stackView.alignment = .center
        
        return stackView
    }()
    
    let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.backgroundColor = UIColor(named: "point")
        
        return button
    }()
    
    let findButton : UIButton = {
        let findbtn = UIButton()
        findbtn.setTitle("ID/PW 찾기", for: .normal)
        findbtn.setTitleColor(UIColor(named: "darkgray"), for: .normal)
        findbtn.backgroundColor = .clear
        
        return findbtn
    }()
    
    let joinButton : UIButton = {
        let joinbtn = UIButton()
        joinbtn.setTitle("회원가입", for: .normal)
        joinbtn.setTitleColor(UIColor(named: "darkgray"), for: .normal)
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
    
    let loginSeparatorView1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "darkgray")
        
        return view
    }()
    
    let orLabel : UILabel = {
        let label = UILabel()
        label.text = "또는"
        label.textColor = UIColor(named: "darkgray")
        
        return label
    }()
    
    let loginSeparatorView2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "darkgray")
        
        return view
    }()
    
    lazy var orStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.loginSeparatorView1, self.orLabel, self.loginSeparatorView2])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 23
        // 스택뷰 사이즈 설정
        stackView.setDimensions(height: 17, width: 151)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        view.addSubview(logoImageView)
        view.addSubview(idpwTFStackView)
        view.addSubview(loginButton)
        view.addSubview(fndjoinStackView)
        view.addSubview(orStackView)
//        view.addSubview(kakaoLoginButton)
        
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        idpwTFStackView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        fndjoinStackView.translatesAutoresizingMaskIntoConstraints = false
        orStackView.translatesAutoresizingMaskIntoConstraints = false
//        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "main")
        
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 237, paddingLeft: 93)
        
        idpwTFStackView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 106.6, paddingLeft: 70)
                                
        loginButton.anchor(top: idpwTFStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 31, paddingLeft: 70)
        loginButton.layer.cornerRadius = 15
        loginButton.centerX(inView: view.self)
        loginButton.clipsToBounds = true
        loginButton.backgroundColor = UIColor(named: "point")
        
        fndjoinStackView.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 98)
        
        orStackView.anchor(top: fndjoinStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 70)
        
//        kakaoLoginButton.anchor(top: orStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 724, paddingLeft: 122)
        
    }
}
