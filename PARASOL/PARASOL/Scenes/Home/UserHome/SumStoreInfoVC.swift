//
//  SumStoreInfoVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/17.
//

import UIKit

class SumStoreInfoVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [For Data]
    var storeId: Int = 0
    
    lazy var store: StoreInformation = StoreInformation(id: 1, shopName: "파라솔 상점", desc: "", latitude: 123, longitude: 678, roadNameAddress: "주소주소주소", availableUmbrella: 14, image: [], times: [])
    
    // MARK: [For transition]
    let transition: CATransition = {
        let transition = CATransition()
        
        transition.duration = 0.4
        transition.type = .push
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        return transition
    }()
    
    // MARK: [UI components]
    // 매장 정보 화면 요소들
    lazy var introView: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 38
        view.layer.maskedCorners = CACornerMask(arrayLiteral: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        view.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "벨라프라하"
        label.font = .B20
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var findLoadButton:UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "find_load"), for: .normal)
        button.setDimensions(height: 56, width: 56)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.cornerRadius = 56 / 2
        button.clipsToBounds = true
        
        return button
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.font = .R16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업시간"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var workingdayLabel: UILabel = {
        let label = UILabel()
        label.font = .R16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var startLabel: UILabel = {
        let label = UILabel()
        label.font = .R16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var spacerLabel: UILabel = {
        let label = UILabel()
        label.font = .R16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var endLabel: UILabel = {
        let label = UILabel()
        label.font = .R16
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
        stackView.distribution = .fillEqually
        stackView.spacing = 15

        return stackView
    }()

    lazy var vStackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.addressLabel, self.storeTimeHStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        
        stackView.setDimensions(height: 56, width: (screenWidth - 50))
        return stackView
    }()
    
    lazy var separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray33")
        view.setDimensions(height: 1, width: (screenWidth - 50))
        
        return view
    }()
    
    // 대여 가능 우산 개수 관련 요소들 생성
    var tag1Label: UILabel = {
        var label = UILabel()
        
        label.text = "대여가능 우산"
        label.font = .B16
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
        label.font = .B16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var umbrellaHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.tag1Label, self.umbrellaImage, self.tag2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 6

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
            rentalVC.beforeView = "SumStoreInfoVC"
            rentalVC.shopId = self.store.id
            let vc = UINavigationController(rootViewController: rentalVC)
            vc.modalPresentationStyle = .fullScreen
            self.view.window?.layer.add(self.transition, forKey: kCATransition)
            self.present(vc, animated: false, completion: nil)
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
            returnVC.beforeView = "SumStoreInfoVC"
            returnVC.shopId = self.store.id
            let vc = UINavigationController(rootViewController: returnVC)
            vc.modalPresentationStyle = .fullScreen
            self.view.window?.layer.add(self.transition, forKey: kCATransition)
            self.present(vc, animated: false, completion: nil)
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
        stackView.spacing = 31

        return stackView
    }()
    
    lazy var vStackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.vStackView1, self.separatorLineView, self.umbrellaHStackView, self.buttonHStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 16
        
        stackView.setDimensions(height: 187, width: (screenWidth - 50))
        return stackView
    }()
    
    lazy var vStackView3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.vStackView2])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        
        stackView.setDimensions(height: 221, width: (screenWidth - 50))
        return stackView
    }()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()

        getStoreInfo(id: storeId)
        
        if let sheetPresentationController = sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheetPresentationController.detents = [
                    .custom { _ in
                        return 284
                    }
                ]
                configureUI()
            } else {
                sheetPresentationController.detents = [.medium()]
                configureUI2()
            }
            sheetPresentationController.preferredCornerRadius = 38
            sheetPresentationController.prefersGrabberVisible = true
        }
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    @objc func goToStoreInfoFunc() {
        let storeVC = StoreInfoVC()
        storeVC.store = self.store
        storeVC.storeId = self.storeId
        storeVC.beforeView = "SumStoreInfoVC"
        let vc = UINavigationController(rootViewController: storeVC)
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(introView)
        introView.addSubview(vStackView3)
        introView.addSubview(findLoadButton)
        

        introView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        vStackView3.anchor(top: introView.topAnchor, paddingTop: 37)
        vStackView3.centerX(inView: introView)
        findLoadButton.anchor(top: vStackView3.topAnchor, right: vStackView3.rightAnchor)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToStoreInfoFunc))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func configureUI2() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(introView)
        introView.addSubview(vStackView3)
        introView.addSubview(findLoadButton)
        

        introView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        vStackView3.centerY(inView: introView)
        vStackView3.centerX(inView: introView)
        findLoadButton.anchor(top: vStackView3.topAnchor, right: vStackView3.rightAnchor)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToStoreInfoFunc))
        view.addGestureRecognizer(tapGesture)
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
    
    // TODO: 네이버지도 길찾기 연동
    func findLoad(dlat: Double, dlng: Double, dname: String, appName: String) {
        let encodeDname: String = dname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
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
    
    func fullDayName(from abbreviation: String) -> String {
        switch abbreviation {
        case "MON":
            return "월요일"
        case "TUE":
            return "화요일"
        case "WED":
            return "수요일"
        case "THU":
            return "목요일"
        case "FRI":
            return "금요일"
        case "SAT":
            return "토요일"
        case "SUN":
            return "일요일"
        case "ALL":
            return "매일"
        case "NORMAL":
            return "평일"
        case "END":
            return "주말"
        default:
            return ""
        }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func getStoreInfo(id: Int) {
        // 특정 매장 조회
        HomeManager.shared.user_getStore(id) { result in
            switch result {
            case .success(let data):
                print("특정 매장 조회")
                print(data) // 데이터 확인용
                // TODO: 불러온 데이터 저장
                self.store = data.information
                // TODO: UI에 불러온 데이터 설정 및 레이아웃 설정
                self.checkRentAvailable(availableNum: self.store.availableUmbrella) // 대여 버튼 활성화 설정
                self.nameLabel.text = self.store.shopName
                self.addressLabel.text = self.store.roadNameAddress
                self.umbrellaNum = self.store.availableUmbrella
                if self.store.times.isEmpty {
                    // 시간 설정 없을 때
                    self.isOpenLabel.text = "영업 정보 없음"
                    self.workingdayLabel.text = ""
                    self.startLabel.text = ""
                    self.spacerLabel.text = ""
                    self.endLabel.text = ""
                } else {
                    // 영업 시간 추가하게 되면 배열 다 읽는 걸로 수정 예정
                    self.isOpenLabel.text = "영업시간"
                    let abbreviatedDay = self.store.times[0].day
                    let fullDay = self.fullDayName(from: abbreviatedDay)
                    self.workingdayLabel.text = fullDay
                    self.startLabel.text = self.store.times[0].openTime
                    self.spacerLabel.text = "-"
                    self.endLabel.text = self.store.times[0].endTime
                }
                self.tag2Label.text = ": " + String(self.umbrellaNum) + "개"
                // 길찾기 버튼에 동작 연동
                let findLoadAction = UIAction { _ in
                    self.findLoad(dlat: self.store.latitude, dlng: self.store.longitude, dname: self.store.shopName, appName: "com.PARASOL")
                }
                self.findLoadButton.addAction(findLoadAction, for: .touchUpInside)
            case .failure(let error):
                print("특정 매장 조회 에러\n\(error)")
            }
        }
    }
}
