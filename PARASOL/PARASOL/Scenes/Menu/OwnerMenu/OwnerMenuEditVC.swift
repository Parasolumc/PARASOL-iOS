//
//  OwnerMenuEditVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/06.
//

import UIKit

class OwnerMenuEditVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 소개 라벨 최대 사이즈
    lazy var labelMaxWidth = screenWidth - 50
    
    // 대여중인 우산의 개수
    var rentNum = 3
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [UI components]
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서울 서대문구 이화여대길 77"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업종료"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "09:00에 영업 시작"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var storeTimeHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.isOpenLabel, self.timeLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10

        return stackView
    }()

    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.addressLabel, self.storeTimeHStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        stackView.setDimensions(height: 100, width: (screenWidth - 50))
        return stackView
    }()
    
    let samplePicsView = UIView()
    
    lazy var introduceLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 설명"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.preferredMaxLayoutWidth = self.labelMaxWidth
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var introduceTextView: UITextView = {
        let textview = UITextView()
        textview.setDimensions(height: 167, width: 342)
        textview.layer.cornerRadius = 20
        textview.backgroundColor = UIColor(named: "gray00")
        textview.textContainerInset = .init(top: 30, left: 20, bottom: 30, right: 20)
        textview.font = UIFont.systemFont(ofSize: 14)
        
        return textview
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 342)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
 
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "정보 수정"
    }
    
    // UI 레이아웃 세팅
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        // 스크롤뷰 이미지 넣기
        view.addSubview(introduceLabel)
        view.addSubview(introduceTextView)
        view.addSubview(confirmButton)
        
        // 스크롤뷰 이미지 추가한 후 삭제하기
        view.addSubview(samplePicsView)
        samplePicsView.translatesAutoresizingMaskIntoConstraints = false
        samplePicsView.backgroundColor = .lightGray
        samplePicsView.layer.cornerRadius = 20
        samplePicsView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        samplePicsView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        vStackView.centerX(inView: view)
        samplePicsView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 17, paddingLeft: 25)
        introduceLabel.anchor(top: samplePicsView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        introduceTextView.anchor(top: introduceLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 18, paddingLeft: 24)
        confirmButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,paddingBottom: 20)
        confirmButton.centerX(inView: view.self)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
