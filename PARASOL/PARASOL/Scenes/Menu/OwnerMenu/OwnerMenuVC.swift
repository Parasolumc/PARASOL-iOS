//
//  OwnerMenuVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/18.
//

import UIKit

class OwnerMenuVC: UIViewController {
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
    
    lazy var editButton:UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.setDimensions(height: 22, width: 22)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 22 / 2
        button.clipsToBounds = true
        
        let goToEditVCAction = UIAction { [weak self] _ in
            let editVC = OwnerMenuEditVC()
            self?.navigationController?.pushViewController(editVC, animated: true)
            print("gg")
        }
            
        button.addAction(goToEditVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var nameEditHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.editButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 13

        return stackView
    }()
    
    let findLoadButton:UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "find_load"), for: .normal)
        button.setDimensions(height: 45, width: 45)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 45 / 2
        button.clipsToBounds = true
        
        return button
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
        let stackView = UIStackView(arrangedSubviews: [self.nameEditHStackView, self.addressLabel, self.storeTimeHStackView])
        
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
        
        label.text = "신촌 디저트 최고 맛집 \n비오는 날엔 갓구운 휘낭시에"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.preferredMaxLayoutWidth = self.labelMaxWidth
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    // 대여 가능 우산 개수 관련 요소들 생성
    var tag1Label: UILabel = {
        var label = UILabel()
        
        label.text = "매장 우산 관리"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    let umbrellaImage: UIImageView = {
            let imageView = UIImageView()
        
            imageView.image = UIImage(named: "umbrella")
        
            return imageView
    }()
    
    lazy var umbrellaHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.tag1Label, self.umbrellaImage])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10

        return stackView
    }()
    
    // 대여중/대여가능 우산 개수 라벨
    var rentLabel: UILabel = {
        var label = UILabel()
        
        label.text = "대여중인 우산"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var rentNumLabel: UILabel = {
        var label = UILabel()
        
        label.text = String(rentNum) + "개"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var rentVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.rentLabel, self.rentNumLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 23
        
        return stackView
    }()
    
    var availableLabel: UILabel = {
        var label = UILabel()
        
        label.text = "대여가능 우산"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var availableNumLabel: UILabel = {
        var label = UILabel()
        
        label.text = String(umbrellaNum) + "개"
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var availableVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.availableLabel, self.availableNumLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 23
        
        return stackView
    }()
    
    lazy var labelHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.rentVStackView, self.availableVStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 84

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
    
    // UI 레이아웃 세팅
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        view.addSubview(findLoadButton)
        // 스크롤뷰 이미지 넣기
        view.addSubview(introduceLabel)
        view.addSubview(umbrellaHStackView)
        view.addSubview(labelHStackView)
        
        // 스크롤뷰 이미지 추가한 후 삭제하기
        view.addSubview(samplePicsView)
        samplePicsView.translatesAutoresizingMaskIntoConstraints = false
        samplePicsView.backgroundColor = .lightGray
        samplePicsView.layer.cornerRadius = 20
        samplePicsView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        samplePicsView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        
        vStackView.anchor(top: view.topAnchor, paddingTop: 65)
        vStackView.centerX(inView: view)
        findLoadButton.anchor(top: vStackView.topAnchor, right: vStackView.rightAnchor)
        samplePicsView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 17, paddingLeft: 25)
        introduceLabel.anchor(top: samplePicsView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        umbrellaHStackView.anchor(top: introduceLabel.bottomAnchor, paddingTop: 50)
        umbrellaHStackView.centerX(inView: view)
        labelHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 55)
        labelHStackView.centerX(inView: view)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
