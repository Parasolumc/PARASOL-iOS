//
//  AgreementVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/14.
//

import UIKit

class AgreementVC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var agree = "UserOwner"
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 체크박스
    enum AgreementButtonType {
        case allAgree // 전체 동의
        case requiredFirst // 필수 동의 첫번째
        case requiredSecond // 필수 동의 두번째
        case requiredThird // 필수 동의 세번째
    }
    
    let agreeLabel : UILabel = {
        let label = UILabel()
        label.text = "다음 약관에 동의해 주세요."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        
        return label
    }()
    
    let allAgreeLabel: UILabel = {
        var label = UILabel()
        
        label.text = "전체동의"
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.setDimensions(height: 26, width: 88)
        
        return label
    }()
    
    lazy var allAgreeView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 342).isActive = true
        view.heightAnchor.constraint(equalToConstant: 45).isActive = true
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(allAgreeLabel)
        allAgreeLabel.centerX(inView: view)
        allAgreeLabel.centerY(inView: view)
        
        return view
    }()
    
    let allCheckBoxBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "checkbox"), for: .normal)
        btn.setDimensions(height: 37.5, width: 37.5)
        btn.tintColor = UIColor(named: "white")
        
        return btn
    }()
    
    
    // '서비스 이용약관'
    let FirstCheckBoxBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "checkbox"), for: .normal)
        btn.setDimensions(height: 37.5, width: 37.5)
        
        return btn
    }()
    
    let FirstEssentialLabel : UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        return label
    }()
    
    lazy var FirstEssentialView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "white")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 43).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        view.layer.cornerRadius = 14
        view.layer.borderColor = UIColor(named: "black")?.cgColor
        view.layer.borderWidth = 1
        view.addSubview(FirstEssentialLabel)
        FirstEssentialLabel.centerX(inView: view)
        FirstEssentialLabel.centerY(inView: view)
        
        return view
    }()
    
    let FirstLabel : UILabel = {
        let label = UILabel()
        label.text = "서비스 이용약관"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        
        return label
    }()
    
    let FirstMoreButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.setDimensions(height: 15, width: 15)
        btn.tintColor = UIColor(named: "black")
        
        return btn
    }()
    
    lazy var FirstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstCheckBoxBtn, self.FirstEssentialView, self.FirstLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 12.5
        
        return stackView
    }()
    
    lazy var FirstFinalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstStackView, self.FirstMoreButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 132
        
        return stackView
    }()
    
    
    // '개인정보수집/이용 동의'
    let SecondCheckBoxBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "checkbox"), for: .normal)
        btn.setDimensions(height: 37.5, width: 37.5)
        
        return btn
    }()
    
    let SecondEssentialLabel : UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        return label
    }()
    
    lazy var SecondEssentialView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "white")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 43).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        view.layer.cornerRadius = 14
        view.layer.borderColor = UIColor(named: "black")?.cgColor
        view.layer.borderWidth = 1
        view.addSubview(SecondEssentialLabel)
        SecondEssentialLabel.centerX(inView: view)
        SecondEssentialLabel.centerY(inView: view)
        
        return view
    }()
    
    let SecondLabel : UILabel = {
        let label = UILabel()
        label.text = "개인정보수집/이용 동의"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        
        return label
    }()
    
    let SecondMoreButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.setDimensions(height: 15, width: 15)
        btn.tintColor = UIColor(named: "black")
        
        return btn
    }()
    
    lazy var SecondStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SecondCheckBoxBtn, self.SecondEssentialView, self.SecondLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 12.5
        
        return stackView
    }()
    
    lazy var SecondFinalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SecondStackView, self.SecondMoreButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 90
        
        return stackView
    }()
    
    
    // '위치기반 서비스 이용약관 동의'
    
    let ThirdCheckBoxBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "checkbox"), for: .normal)
        btn.setDimensions(height: 37.5, width: 37.5)
        
        return btn
    }()
    
    let ThirdEssentialLabel : UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.textColor = UIColor(named: "black")
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        
        return label
    }()
    
    lazy var ThirdEssentialView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "white")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 43).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        view.layer.cornerRadius = 14
        view.layer.borderColor = UIColor(named: "black")?.cgColor
        view.layer.borderWidth = 1
        view.addSubview(ThirdEssentialLabel)
        ThirdEssentialLabel.centerX(inView: view)
        ThirdEssentialLabel.centerY(inView: view)
        
        return view
    }()
    
    let ThirdLabel : UILabel = {
        let label = UILabel()
        label.text = "위치기반 서비스 이용약관 동의"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        
        return label
    }()
    
    let ThirdMoreButton : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "arrow"), for: .normal)
        btn.setDimensions(height: 15, width: 15)
        btn.tintColor = UIColor(named: "black")
        
        return btn
    }()
    
    lazy var ThirdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ThirdCheckBoxBtn, self.ThirdEssentialView, self.ThirdLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 12.5
        
        return stackView
    }()
    
    lazy var ThirdFinalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ThirdStackView, self.ThirdMoreButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 53
        
        return stackView
    }()
    
    // First + Second + Third
    lazy var FinalFinalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstFinalStackView, self.SecondFinalStackView, self.ThirdFinalStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 30
        
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToJoinVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
        buttonActions()
    }
    
    // MARK: - Actions
    
    func setNavigationBar() {
        self.navigationItem.title = "약관동의"
    }
    
    func buttonActions() {
        let goToagree1VCAction = UIAction {[weak self] _ in
            guard let self = self else { return }
            let agree1VC = Agreement1VC()
            self.navigationController?.pushViewController(agree1VC, animated: true)
        }
        
        FirstMoreButton.addAction(goToagree1VCAction, for: .touchUpInside)
        
        let goToagree2VCAction = UIAction {[weak self] _ in
            guard let self = self else { return }
            let agree2VC = Agreement2VC()
            self.navigationController?.pushViewController(agree2VC, animated: true)
        }
        
        SecondMoreButton.addAction(goToagree2VCAction, for: .touchUpInside)
        
        let goToagree3VCAction = UIAction {[weak self] _ in
            guard let self = self else { return }
            let agree3VC = Agreement3VC()
            self.navigationController?.pushViewController(agree3VC, animated: true)
        }
        
        ThirdMoreButton.addAction(goToagree3VCAction, for: .touchUpInside)
    }
    
    func configureUI() {
        view.addSubview(agreeLabel)
        view.addSubview(allAgreeView)
        view.addSubview(allCheckBoxBtn)
        view.addSubview(FinalFinalStackView)
        view.addSubview(nextButton)
        
        view.backgroundColor = UIColor(named: "white")
        
        agreeLabel.translatesAutoresizingMaskIntoConstraints = false
        allAgreeLabel.translatesAutoresizingMaskIntoConstraints = false
        allAgreeView.translatesAutoresizingMaskIntoConstraints = false
        allCheckBoxBtn.translatesAutoresizingMaskIntoConstraints = false
        FirstCheckBoxBtn.translatesAutoresizingMaskIntoConstraints = false
        FirstEssentialLabel.translatesAutoresizingMaskIntoConstraints = false
        FirstEssentialView.translatesAutoresizingMaskIntoConstraints = false
        FirstLabel.translatesAutoresizingMaskIntoConstraints = false
        FirstMoreButton.translatesAutoresizingMaskIntoConstraints = false
        SecondCheckBoxBtn.translatesAutoresizingMaskIntoConstraints = false
        SecondEssentialLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondEssentialView.translatesAutoresizingMaskIntoConstraints = false
        SecondLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondMoreButton.translatesAutoresizingMaskIntoConstraints = false
        ThirdCheckBoxBtn.translatesAutoresizingMaskIntoConstraints = false
        ThirdEssentialLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdEssentialView.translatesAutoresizingMaskIntoConstraints = false
        ThirdLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdMoreButton.translatesAutoresizingMaskIntoConstraints = false
        nextLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        agreeLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: allAgreeView.topAnchor, right: view.rightAnchor, paddingTop: 118, paddingLeft: 110, paddingBottom: 21, paddingRight: 110, width: 170, height: 28)
        allAgreeView.anchor(top: agreeLabel.bottomAnchor, left: view.leftAnchor, bottom: FinalFinalStackView.topAnchor, right: view.rightAnchor, paddingTop: 21, paddingLeft: 24, paddingBottom: 43, paddingRight: 24)
        allCheckBoxBtn.anchor(top: allAgreeView.topAnchor, left: allAgreeLabel.rightAnchor, bottom: allAgreeView.bottomAnchor, right: allAgreeView.rightAnchor, paddingTop: 4, paddingLeft: 71, paddingBottom: 3.5, paddingRight: 21.5)
        FinalFinalStackView.anchor(top: allAgreeView.bottomAnchor, left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, paddingTop: 43, paddingLeft: 24, paddingBottom: 374, paddingRight: 24)
        nextButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    @objc func goToJoinVC() {
        let userjoinVC = UserJoinVC()
        let ownerjoinVC = OwnerJoinVC()
        
        if SelectVC.shared.user == agree {
            userjoinVC.join = "UserJoin"
            self.navigationController?.pushViewController(userjoinVC, animated: true)
        } else if SelectVC.shared.owner == agree {
            ownerjoinVC.join = "OwnerJoin"
            self.navigationController?.pushViewController(ownerjoinVC, animated: true)
        }
    }
}
