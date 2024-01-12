//
//  FindIDVC.swift
//  PARASOL
//
//  Created by 서주영 on 2024/01/09.
//

import UIKit

class FindIDVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width
    
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

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        self.view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(findIDStackView)
        
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
        
        findIDStackView.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 24, paddingRight: 24)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}
