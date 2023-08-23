//
//  StoreInfoVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/24.
//

import UIKit

class StoreInfoVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    let testURL: [String] = []
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 소개 라벨 최대 사이즈
    lazy var labelMaxWidth = screenWidth - 50
    
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [For Data]
    var storeId: Int = 0
    
    lazy var store: StoreInformation = StoreInformation(id: 1, shopName: "파라솔 상점", desc: "우산을 빌려주는 여기는 파라솔~", latitude: 123, longitude: 678, roadNameAddress: "주소주소주소", availableUmbrella: 14, image: [], times: [])
    var images: [String] = []
    
    // MARK: [UI components]
    var beforeView: String = "" // SumStoreInfoVC or SearchVC
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .B24
        label.textColor = UIColor(named: "black")
        return label
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
        
        label.text = "주소"
        label.font = .M16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업종료"
        label.font = .SB14
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "09:00에 영업 시작"
        label.font = .M14
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
    
    let picsScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isPagingEnabled = true
        
        return scrollview
    }()
    
    lazy var image1: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = UIColor(named: "gray00_opacity")
        imageView.contentMode = .scaleToFill
        imageView.setDimensions(height: 107, width: 129)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true

        return imageView
    }()
    
    lazy var picsStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.image1])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 8
        
        return stackview
    }()
    
    lazy var introduceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점 소개"
        label.font = .M14
        label.textColor = UIColor(named: "black")
        label.preferredMaxLayoutWidth = self.labelMaxWidth
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    // 대여 가능 우산 개수 관련 요소들 생성
    var tag1Label: UILabel = {
        var label = UILabel()
        
        label.text = "대여가능 우산"
        label.font = .B20
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    let umbrellaImage: UIImageView = {
            let imageView = UIImageView()
        
            imageView.image = UIImage(named: "umbrella")
        
            return imageView
    }()
    
    lazy var tag2Label: UILabel = {
        var label = UILabel()
        
        label.text = ": " + String(self.umbrellaNum) + "개"
        label.font = .SB20
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var umbrellaHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.tag1Label, self.umbrellaImage, self.tag2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10

        return stackView
    }()
    
    // 대여/반납 버튼 생성
    lazy var rentalButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("대여", for: .normal)
        button.titleLabel?.font = .SB16
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 54, width: 126)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "main")
        
        let goToRentalVCAction = UIAction { _ in
            let rentalVC = Rental_ReturnVC()
            rentalVC.nowFun = "Rental"
            rentalVC.beforeView = "StoreInfoVC"
            rentalVC.shopId = self.store.id
            self.navigationController?.pushViewController(rentalVC, animated: true)
            }
            
        button.addAction(goToRentalVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var returnButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("반납", for: .normal)
        button.titleLabel?.font = .SB16
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 54, width: 126)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "main")
        
        let goToReturnVCAction = UIAction { _ in
            let returnVC = Rental_ReturnVC()
            returnVC.nowFun = "Return"
            returnVC.beforeView = "StoreInfoVC"
            returnVC.shopId = self.store.id
            self.navigationController?.pushViewController(returnVC, animated: true)
            }
            
        button.addAction(goToReturnVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.rentalButton, self.returnButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20

        return stackView
    }()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchStoreData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        if beforeView == "SumStoreInfoVC" {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "white")
            // 네비게이션 바 뒤로가기 아이템 넣기
            setNCLB()
        }
    }
    
    // 네비게이션 바 왼쪽 아이템 세팅
    func setNCLB() {
        // left bar item
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 25.0, height: 25.0))

        let navigatorArrow: UIImageView = {
            let imageView = UIImageView()

            imageView.image = UIImage(named: "navigator")

            imageView.contentMode = .scaleToFill
            imageView.setDimensions(height: 25.0, width: 25.0)

            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBeforeVCFunc))
            imageView.addGestureRecognizer(tapGesture)

            return imageView
        }()

        leftCustomView.addSubview(navigatorArrow)
        navigatorArrow.translatesAutoresizingMaskIntoConstraints = false

        let leftBarItem = UIBarButtonItem(customView: leftCustomView)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    // UI 레이아웃 세팅
    func imageConfigureUI() {
        
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(vStackView)
        view.addSubview(findLoadButton)
        view.addSubview(picsScrollView)
        picsScrollView.addSubview(picsStackView)
        view.addSubview(introduceLabel)
        view.addSubview(umbrellaHStackView)
        view.addSubview(buttonHStackView)
        
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        vStackView.centerX(inView: view)
        findLoadButton.anchor(top: vStackView.topAnchor, right: vStackView.rightAnchor)
        
        picsScrollView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 17, paddingLeft: 25)
        picsScrollView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        
        picsStackView.anchor(top: picsScrollView.topAnchor, left: picsScrollView.leftAnchor, bottom: picsScrollView.bottomAnchor, right: picsScrollView.rightAnchor)
        
        introduceLabel.anchor(top: picsScrollView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        umbrellaHStackView.anchor(top: introduceLabel.bottomAnchor, paddingTop: 50)
        umbrellaHStackView.centerX(inView: view)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 62)
        buttonHStackView.centerX(inView: view)
 
    }
    
    func noneImageConfigureUI() {
        
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(vStackView)
        view.addSubview(findLoadButton)
        view.addSubview(introduceLabel)
        view.addSubview(umbrellaHStackView)
        view.addSubview(buttonHStackView)
        
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        vStackView.centerX(inView: view)
        findLoadButton.anchor(top: vStackView.topAnchor, right: vStackView.rightAnchor)
        introduceLabel.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 17, paddingLeft: 25)
        umbrellaHStackView.anchor(top: introduceLabel.bottomAnchor, paddingTop: 182)
        umbrellaHStackView.centerX(inView: view)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 62)
        buttonHStackView.centerX(inView: view)
 
    }
    
    @objc func goToBeforeVCFunc() {
        dismiss(animated: true, completion: nil)
    }
    
    // TODO: 우산 대여가능 여부 체크
    func checkRentAvailable(availableNum: Int) {
        if availableNum == 0 {
            rentalButton.isEnabled = false
            rentalButton.backgroundColor = UIColor(named: "gray00")
        } else {
            rentalButton.isEnabled = true
            rentalButton.backgroundColor = UIColor(named: "main")
        }
    }
    
    // TODO: 현재 시간 가져오기
    func getCurrentTime() -> [String : String] {
        let time = Date()
        let timeFormatter = DateFormatter()
                
        timeFormatter.dateFormat = "HH"
        let hour = timeFormatter.string(from: time)
        timeFormatter.dateFormat = "mm"
        let minute = timeFormatter.string(from: time)
  
        timeFormatter.dateFormat = "EEEE" // "EEEE"는 전체 요일 이름을 나타냄

        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: time) // 1: 일요일, 2: 월요일, ..., 7: 토요일

        let days = ["SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"]
        let weekDayName = days[dayOfWeek - 1]
        
        return ["hour": hour, "minute": minute, "day": weekDayName]
    }
    
    // TODO: 네이버지도 길찾기 연동
    func findLoad(dlat: Double, dlng: Double, dname: String, appName: String) {
        let encodeDname: String = dname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let dlat: String = String(dlat)
        let dlng: String = String(dlng)
        let url = URL(string: "nmap://route/walk?&dlat=\(dlat)&dlng=\(dlng)&dname=\(encodeDname)&appname=\(appName)")!
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!

        if UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        } else {
          UIApplication.shared.open(appStoreURL)
        }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func addPics(pics: Array<String>) {
        picsStackView.removeArrangedSubview(self.image1)
        image1.removeFromSuperview()
        
        for img in pics {
            let imageView = UIImageView()
            
            let url = URL(string: img)
            imageView.load(url: url!)
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.backgroundColor = UIColor(named: "gray00_opacity")
            imageView.contentMode = .scaleToFill
            imageView.setDimensions(height: 107, width: 129)
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
            
            picsStackView.addArrangedSubview(imageView)
        }
    }
    
    func setData() {
        self.nameLabel.text = self.store.shopName
        self.addressLabel.text = self.store.roadNameAddress
        self.introduceLabel.text = self.store.desc
        self.umbrellaNum = self.store.availableUmbrella
        self.tag2Label.text = ": " + String(self.umbrellaNum) + "개"
        if images != [] {
            addPics(pics: images)
        }
    }

    func fetchStoreData() {
        HomeManager.shared.user_getStore(storeId) { result in
            switch result {
            case .success(let data):
                print("특정 매장 정보")
                print(data)
                // TODO: 불러온 데이터 저장
                self.store = data.information
                self.images.removeAll()
                for image in self.store.image {
                    self.images.append(image.url)
                }
                // TODO: UI에 불러온 데이터 설정 및 레이아웃 설정
                self.checkRentAvailable(availableNum: self.store.availableUmbrella) // 대여 버튼 활성화 설정
                if self.images != [] {
                    self.setData()
                    self.imageConfigureUI()
                } else {
                    self.setData()
                    self.noneImageConfigureUI()
                }
                // 길찾기 버튼에 동작 연동
                let findLoadAction = UIAction { _ in
                    self.findLoad(dlat: self.store.latitude, dlng: self.store.longitude, dname: self.store.shopName, appName: "com.PARASOL")
                }
                self.findLoadButton.addAction(findLoadAction, for: .touchUpInside)
            case .failure(let error):
                print("특정 매장 정보 에러\n\(error)")
            }
        }
    }
}
