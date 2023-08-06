//
//  UserJoinVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/04.
//

import UIKit

class OwnerJoinVC : UIViewController {
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let joinNavigationBar : UINavigationBar = {
        let navigator = UINavigationBar()
        
        return navigator
    }()
    
    let joinLabel : UILabel = {
        let label = UILabel()
        label.text = "파라솔과 함께 \n우산을 빌려주러 가볼까요 ?"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "이메일"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let emailTextField : UITextField = {
        let emailtf = UITextField()
        emailtf.placeholder = "이메일을 입력하세요."
        emailtf.textColor = UIColor(named: "gray")
        emailtf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: emailtf.frame.size.height-1, width: emailtf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        emailtf.layer.addSublayer((border))
        emailtf.textAlignment = .center
        
        return emailtf
    }()
    
    // 이메일 입력 스택 뷰
    lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailLabel, self.emailTextField])
        
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
    
    let pwLabel : UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let pwTextField : UITextField = {
        let pwtf = UITextField()
        pwtf.placeholder = "8~12자리 영문, 숫자 조합"
        pwtf.textColor = UIColor(named: "gray")
        pwtf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: pwtf.frame.size.height-1, width: pwtf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        pwtf.layer.addSublayer((border))
        pwtf.textAlignment = .center
        
        return pwtf
    }()
    
    // 비밀번호 설정 스택 뷰
    lazy var pwStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.pwLabel, self.pwTextField])
        
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
        label.textColor = UIColor(named: "gray")
        
        return label
    }()
    
    let pwcheckTextField : UITextField = {
        let pwchecktf = UITextField()
        pwchecktf.placeholder = "8~12자리 영문, 숫자 조합"
        pwchecktf.textColor = UIColor(named: "gray")
        pwchecktf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: pwchecktf.frame.size.height-1, width: pwchecktf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        pwchecktf.layer.addSublayer((border))
        pwchecktf.textAlignment = .center
        
        return pwchecktf
    }()
    
    // 비밀번호 확인 스택 뷰
    lazy var pwcheckStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.pwcheckLabel, self.pwcheckTextField])
        
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
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "이름"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let nameTextField : UITextField = {
        let nametf = UITextField()
        nametf.placeholder = "이름을 입력하세요."
        nametf.textColor = UIColor(named: "gray")
        nametf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nametf.frame.size.height-1, width: nametf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        nametf.layer.addSublayer((border))
        nametf.textAlignment = .center
        
        return nametf
    }()
    
    // 이름 입력 스택 뷰
    lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailLabel, self.emailTextField])
        
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
    
    let authLabel: UILabel = {
        let label = UILabel()
        label.text = "휴대폰 인증"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let phonenumTextField: UITextField = {
        let phonenumtf = UITextField()
        phonenumtf.placeholder = "휴대폰 번호를 입력하세요."
        phonenumtf.textColor = UIColor(named: "gray")
        phonenumtf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: phonenumtf.frame.size.height-1, width: phonenumtf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        phonenumtf.layer.addSublayer((border))
        phonenumtf.textAlignment = .center
        
        return phonenumtf
    }()
    
    let authButton: UIButton = {
        let authbtn = UIButton()
        authbtn.setTitle("인증요청", for: .normal)
        authbtn.setTitleColor(UIColor(named: "black"), for: .normal)
        authbtn.backgroundColor = UIColor(named: "main")
        
        return authbtn
    }()
    
    // 휴대폰 입력 칸 스택 뷰
    lazy var numInputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authnumTextField, self.confirmButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 113
        stackView.setDimensions(height: 42, width: (screenWidth - 50)) // 스택뷰 사이즈 설정
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    let authnumTextField: UITextField = {
        let authnumtf = UITextField()
        authnumtf.placeholder = "인증 번호를 입력하세요."
        authnumtf.textColor = UIColor(named: "gray")
        authnumtf.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: authnumtf.frame.size.height-1, width: authnumtf.frame.width, height: 1)
        if let uiColor = UIColor(named: "lightgray") {
            border.backgroundColor = uiColor.cgColor
        }
        authnumtf.layer.addSublayer((border))
        authnumtf.textAlignment = .center
        
        return authnumtf
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "05:00"
        label.textColor = UIColor(named: "red")
        label.backgroundColor = .clear
        
        return label
    }()
    
    let confirmButton: UIButton = {
        let confbtn = UIButton()
        confbtn.setTitle("확인", for: .normal)
        confbtn.setTitleColor(UIColor(named: "black"), for: .normal)
        confbtn.backgroundColor = UIColor(named: "main")
        
        return confbtn
    }()
    
    lazy var labelNbtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.timeLabel, self.confirmButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 10
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 34, width: 62)
        stackView.alignment = .center
        
        return stackView
    }()
    
    lazy var authInputStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authnumTextField, self.labelNbtnStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 74
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 43, width: (screenWidth - 50))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authnumStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.numInputStackView, self.authInputStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 7
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 90, width: (screenWidth - 48))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var authStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.authLabel, self.authnumStackView])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 15
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 43, width: (screenWidth - 50))
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
        stackView.setDimensions(height: 501, width: (screenWidth - 48))
        
        return stackView
    }()
    
    let nextButton: UIButton = {
        let nextbtn = UIButton()
        nextbtn.setTitle("다음", for: .normal)
        nextbtn.backgroundColor = UIColor(named: "main")
        
        return nextbtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        view.addSubview(joinNavigationBar)
        view.addSubview(joinLabel)
        view.addSubview(joinStackView)
        view.addSubview(nextButton)
        
        joinNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        joinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(named: "white")
        
        joinNavigationBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        joinLabel.anchor(top: joinNavigationBar.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 24)
        joinStackView.anchor(top: joinLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 36, paddingLeft: 24)
        nextButton.anchor(top: joinStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 41, paddingLeft: 0, paddingRight: 0)
    }
}
