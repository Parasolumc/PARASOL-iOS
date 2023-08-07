//
//  SelectVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/07/31.
//

import UIKit

class SelectVC : UIViewController {
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    let selectNavigationBar : UINavigationBar = {
        let navigationbar = UINavigationBar()
        let backBtn = UIBarButtonItem(image: UIImage(named: "navigator"), style: .plain, target: SelectVC.self, action: nil)
        
        return navigationbar
    }()
    
    let selectLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 사용자이신가요?"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        
        return label
    }()
    
// 이용자 구분 버튼 - User
    let userLabel1: UILabel = {
        var label = UILabel()
        
        label.text = "일반"
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    let userLabel2: UILabel = {
        var label = UILabel()
        
        label.text = "우산을 빌릴래요!"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var userLabelVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.userLabel1, self.userLabel2])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 21
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    
    lazy var userButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(userLabelVStackView)
        userLabelVStackView.centerX(inView: view)
        userLabelVStackView.centerY(inView: view)
        
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToUserJoinVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()

// 이용자 구분 버튼 - Owner
    let ownerLabel1: UILabel = {
        var label = UILabel()
        
        label.text = "사장님"
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    let ownerLabel2: UILabel = {
        var label = UILabel()
        
        label.text = "우산을 빌려줄래요!"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .black
        
        return label
    }()
    
    lazy var ownerLabelVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ownerLabel1, self.ownerLabel2])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 21
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    
    lazy var ownerButton: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(ownerLabelVStackView)
        ownerLabelVStackView.centerX(inView: view)
        ownerLabelVStackView.centerY(inView: view)
        
        //view.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        //view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    lazy var btnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.userButton, self.ownerButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        // 요소간 간격 조정
        stackView.spacing = 24
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 150, width: (screenWidth - 66))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
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
        
        view.addSubview(selectNavigationBar)
        view.addSubview(selectLabel)
        view.addSubview(btnStackView)
        
        self.view.backgroundColor = UIColor(named: "white")
        
        selectNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        userButton.translatesAutoresizingMaskIntoConstraints = false
        ownerButton.translatesAutoresizingMaskIntoConstraints = false
        btnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        selectNavigationBar.barTintColor = UIColor(named: "white")
        
        selectNavigationBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        selectLabel.anchor(top: selectNavigationBar.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 147, paddingLeft: 118, paddingRight: 118, width: 154, height: 21)
        
        btnStackView.anchor(top: selectLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 84, paddingLeft: 33, paddingRight: 33, width: 324, height: 150)
    }
        // MARK: - Helpers
        // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    @objc func goToUserJoinVC() {
            let userjoinVC = UserJoinVC()
            userjoinVC.join = "UserJoin"
            self.navigationController?.pushViewController(userjoinVC, animated: true)
        }
}


