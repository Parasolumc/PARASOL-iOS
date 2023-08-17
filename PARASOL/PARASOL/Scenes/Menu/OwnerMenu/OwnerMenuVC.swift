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
    
    // MARK: [For Data]
    var shopInformation: [OwnerStoreInformation] = []
    
    // MARK: [UI components]
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 소개 라벨 최대 사이즈
    lazy var labelMaxWidth = screenWidth - 50
    
    // 총 우산 개수
    var totalNum = 3
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // 영업중인 요일
    var workingday = "화욜"
    
    // 영업 시작, 종료 시간
    var starttime = "11:00"
    var endtime = "19:70"
    
    // MARK: [UI components]
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명234"
        label.font = .B24
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var nameEditHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 13

        return stackView
    }()
    
    let findLoadButton: UIButton = {
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
        
        label.text = "주소 어쩌구"
        label.font = .M16
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
    
    lazy var workingdayLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.workingday)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var startLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.starttime)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var spacerLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var endLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.endtime)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var timeStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.workingdayLabel, self.startLabel, self.spacerLabel, self.endLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 4
        
        return stackview
    }()
    
    lazy var storeTimeHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.isOpenLabel, self.timeStackView])
        
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
    
    let picsScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isPagingEnabled = true
        
        return scrollview
    }()
    
    let picsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 8
        
        return stackview
    }()
    
    let addPicsView: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00_opacity")
        view.layer.cornerRadius = 20
        
        return view
    }()
    
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
        
        label.text = "우리 매장 우산 관리"
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
        
        label.text = "총 우산"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var rentNumLabel: UILabel = {
        var label = UILabel()
        
        label.text = String(totalNum) + "개"
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
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 342)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(named: "main")
        
        let goToEditVCAction = UIAction { _ in
            let editVC = OwnerMenuEditVC()
            
            // 전달할 값들을 설정
            editVC.nameLabel.text = self.nameLabel.text ?? ""
            editVC.addressLabel.text = self.addressLabel.text ?? ""
            editVC.workingday = self.workingdayLabel.text ?? ""
            editVC.starttime = self.startLabel.text ?? ""
            editVC.endtime = self.endLabel.text ?? ""
            editVC.introduceTextView.text = self.introduceLabel.text ?? ""
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }
            
        button.addAction(goToEditVCAction, for: .touchUpInside)
        
        return button
    }()
    

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // UI 레이아웃 세팅
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        view.addSubview(findLoadButton)
        view.addSubview(picsScrollView)
        view.addSubview(introduceLabel)
        view.addSubview(umbrellaHStackView)
        view.addSubview(labelHStackView)
        view.addSubview(editButton)
        
        vStackView.anchor(top: view.topAnchor, paddingTop: 65)
        vStackView.centerX(inView: view)
        
        findLoadButton.anchor(top: vStackView.topAnchor, right: vStackView.rightAnchor)
        
        picsScrollView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 17, paddingLeft: 25, paddingRight: 25)
        picsScrollView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        picsScrollView.addSubview(picsStackView)
        
        picsStackView.anchor(top: picsScrollView.topAnchor, left: picsScrollView.leftAnchor, bottom: picsScrollView.bottomAnchor, right: picsScrollView.rightAnchor)
        picsStackView.addArrangedSubview(addPicsView)
        
        introduceLabel.anchor(top: picsScrollView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        
        umbrellaHStackView.anchor(top: introduceLabel.bottomAnchor, paddingTop: 50)
        umbrellaHStackView.centerX(inView: view)
        
        labelHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 55)
        labelHStackView.centerX(inView: view)
        
        editButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 24, paddingBottom: 20)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    func fetchData() {
        HomeManager.shared.owner_getStore() { result in
            switch result {
            case .success(let data):
                print("본인 매장 조회")
                print(data) // 데이터 확인용
                // 데이터를 UI 요소에 적용
                let info = data.information
                DispatchQueue.main.async {
                    self.nameLabel.text = info.shopName
                    self.addressLabel.text = info.roadNameAddress
                    self.workingdayLabel.text = "매일" //model에 추가
                    self.startLabel.text = info.openTime
                    self.endLabel.text = info.closeTime
                    self.introduceLabel.text = info.desc
                    //self.totalNum = info.totalUmbrella
                    self.umbrellaNum = info.availableUmbrella
                    
                    //self.rentNumLabel.text = "\(self.totalNum)개"
                    self.availableNumLabel.text = "\(self.umbrellaNum)개"
                }
                
            case .failure(let error):
                print("본인 매장 조회 에러\n\(error)")
            }
        }
    }
    

}
