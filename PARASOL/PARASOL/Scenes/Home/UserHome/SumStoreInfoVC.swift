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
        label.font = .B18
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var findLoadButton:UIButton = {
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
        label.font = .M16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업종료"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "09:00에 영업 시작"
        label.font = .M16
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
        stackView.spacing = 10
        
        stackView.setDimensions(height: 80, width: (screenWidth - 74))
        return stackView
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

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()

        getStoreInfo(id: storeId)
        
        if let sheetPresentationController = sheetPresentationController {
            if #available(iOS 16.0, *) {
                sheetPresentationController.detents = [
                    .custom { _ in
                        return 300
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
        introView.addSubview(vStackView)
        introView.addSubview(findLoadButton)
        introView.addSubview(umbrellaHStackView)
        introView.addSubview(buttonHStackView)
        

        introView.centerX(inView: view)
        introView.centerY(inView: view)
        vStackView.anchor(top: introView.topAnchor, paddingTop: 41)
        vStackView.centerX(inView: introView)
        findLoadButton.anchor(top: introView.topAnchor, right: introView.rightAnchor, paddingTop: 37, paddingRight: 40)
        umbrellaHStackView.anchor(top: vStackView.bottomAnchor, paddingTop: 38)
        umbrellaHStackView.centerX(inView: introView)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 34)
        buttonHStackView.centerX(inView: introView)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToStoreInfoFunc))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func configureUI2() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(introView)
        introView.addSubview(vStackView)
        introView.addSubview(findLoadButton)
        introView.addSubview(umbrellaHStackView)
        introView.addSubview(buttonHStackView)
        

        introView.centerX(inView: view)
        introView.centerY(inView: view)
        vStackView.anchor(top: introView.topAnchor)
        vStackView.centerX(inView: introView)
        findLoadButton.anchor(top: introView.topAnchor, right: introView.rightAnchor, paddingTop: 37, paddingRight: 40)
        umbrellaHStackView.anchor(top: vStackView.bottomAnchor, paddingTop: 128)
        umbrellaHStackView.centerX(inView: introView)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 34)
        buttonHStackView.centerX(inView: introView)
        
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
