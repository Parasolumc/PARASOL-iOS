//
//  Agreement2VC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/14.
//

import UIKit

class Agreement2VC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let Agreement2ScrollView : UIScrollView = {
        let scrollview = UIScrollView()
        
        return scrollview
    }()
    
    let Agreement2TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "개인정보수집 및 이용동의서"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 16)
        
        return label
    }()
    
    let Agree2Exp1Label : UILabel = {
        let label = UILabel()
        label.text = "파라솔(이하 '회사'라고 합니다)은 개인정보보호법 등 관련 법령상의 개인정보보호 규정을 준수하며 귀하의 개인정보보호에 최선을 다하고 있습니다. 회사는 개인정보보호법에 근거하여 다음과 같은 내용으로 개인정보를 수집 및 처리하고자 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let Agree2Exp2Label : UILabel = {
        let label = UILabel()
        label.text = "다음의 내용을 자세히 읽어보시고 모든 내용을 이해하신 후에 동의 여부를 결정해주시기 바랍니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FirstTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제1조(개인정보 수집 및 이용 목적)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FirstExpLabel : UILabel = {
        let label = UILabel()
        label.text = "이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 목적 이외의 용도로는 사용되지 않습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FirstExamLabel : UILabel = {
        let label = UILabel()
        label.text = " · 본인확인"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FirstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstTitleLabel, self.FirstExpLabel, self.FirstExamLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SecondTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제2조(개인정보 수집 및 이용 항목)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SecondExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회사는 개인정보 수집 목적을 위하여 다음과 같은 정보를 수집합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SecondExamLabel : UILabel = {
        let label = UILabel()
        label.text = " · 전화번호 및 이메일"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SecondStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SecondTitleLabel, self.SecondExpLabel, self.SecondExamLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let ThirdTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제3조(개인정보 보유 및 이용 기간)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 수집한 개인정보는 수집·이용 동의일로부터 개인정보 수집·이용 목적을 달성할 때까지 보관 및 이용합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 개인정보 보유기간의 경과, 처리목적의 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var ThirdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ThirdTitleLabel, self.ThirdCon1Label, self.ThirdCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FourTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제4조(동의 거부 관리)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FourExp1Label : UILabel = {
        let label = UILabel()
        label.text = "귀하는 본 안내에 따른 개인정보 수집·이용에 대하여 동의를 거부할 권리가 있습니다. 다만, 귀하가 개인정보 동의를 거부하시는 경우에 가입불가의 불이익이 발생할 수 있음을 알려드립니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FourExp2Label : UILabel = {
        let label = UILabel()
        label.text = "본인은 위의 동의서 내용을 충분히 숙지하였으며,위와 같이 개인정보를 수집·이용하는데 동의합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FourStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FourTitleLabel, self.FourExp1Label, self.FourExp2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FiveTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제5조(개인정보의 제3자 제공)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회사는 개인정보보호법에 근거하여 다음과 같은 내용으로 개인정보를 제3자에게 제공하고자 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 개인정보를 제공 받는 제3자 : 파라솔 제휴 매장"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 개인정보 제공 목적 : 우산 대여/반납"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 개인정보 제공 항목 : 대여자 닉네임, QR코드"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 개인정보 보유 및 이용기간 : 개인정보 제공 목적 달성일까지"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon5Label : UILabel = {
        let label = UILabel()
        label.text = " 5. 개인정보 제공 거부 시 불이익 : 서비스 이용 불가"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FiveStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FiveTitleLabel, self.FiveExpLabel, self.FiveCon1Label, self.FiveCon2Label, self.FiveCon3Label, self.FiveCon4Label, self.FiveCon5Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let DateLabel : UILabel = {
        let label = UILabel()
        label.text = "2023년 09월 01일"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        
        return label
    }()
    
    let NameLabel : UILabel = {
        let label = UILabel()
        label.text = "성명 : 이다현"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        
        return label
    }()
    
    lazy var ContentsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.Agree2Exp1Label, self.Agree2Exp2Label, self.FirstStackView, self.SecondStackView, self.ThirdStackView, self.FourStackView, self.FiveStackView, self.DateLabel, self.NameLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var FullStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.Agreement2TitleLabel, self.ContentsStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 20
        
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    
    func setNavigationBar() {
        self.navigationItem.title = "약관동의"
    }
    
    func configureUI() {
        view.addSubview(Agreement2ScrollView)
        view.addSubview(FullStackView)
        
        view.backgroundColor = UIColor(named: "white")
        self.FullStackView.backgroundColor = UIColor(named: "white")
        self.Agreement2ScrollView.backgroundColor = UIColor(named: "white")
        
        Agree2Exp1Label.translatesAutoresizingMaskIntoConstraints = false
        Agree2Exp2Label.translatesAutoresizingMaskIntoConstraints = false
        FirstTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FirstExpLabel.translatesAutoresizingMaskIntoConstraints = false
        FirstExamLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondExpLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondExamLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdCon1Label.translatesAutoresizingMaskIntoConstraints = false
        ThirdCon2Label.translatesAutoresizingMaskIntoConstraints = false
        FourTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FourExp1Label.translatesAutoresizingMaskIntoConstraints = false
        FourExp2Label.translatesAutoresizingMaskIntoConstraints = false
        FiveTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FiveExpLabel.translatesAutoresizingMaskIntoConstraints = false
        FiveCon1Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon2Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon3Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon4Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon5Label.translatesAutoresizingMaskIntoConstraints = false
        DateLabel.translatesAutoresizingMaskIntoConstraints = false
        NameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 스크롤 뷰 레이아웃 설정
        self.Agreement2ScrollView.addSubview(FullStackView)
        
        self.Agreement2ScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.Agreement2ScrollView.widthAnchor.constraint(equalToConstant: (screenWidth - 90)).isActive = true
        self.Agreement2ScrollView.heightAnchor.constraint(equalToConstant: (screenHeight - 136)).isActive = true
        
        self.Agreement2ScrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.Agreement2ScrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.Agreement2ScrollView.contentSize = self.FullStackView.bounds.size
        
        FullStackView.anchor(top: view.topAnchor, paddingTop: 136)
        
        // 스택 뷰 레이아웃 설정
        self.FullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.FullStackView.topAnchor.constraint(equalTo: self.Agreement2ScrollView.contentLayoutGuide.topAnchor).isActive = true
        self.FullStackView.leadingAnchor.constraint(equalTo: self.Agreement2ScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        self.FullStackView.bottomAnchor.constraint(equalTo: self.Agreement2ScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        self.FullStackView.trailingAnchor.constraint(equalTo: self.Agreement2ScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        
        self.FullStackView.widthAnchor.constraint(equalTo: self.Agreement2ScrollView.widthAnchor, multiplier: 1.0).isActive = true
    }
}
