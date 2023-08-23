//
//  OwnerVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit

class OwnerVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [UI components]
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .B24
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서울 서대문구 이화여대길 77"
        label.font = .M16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.addressLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        stackView.setDimensions(height: 56, width: (screenWidth - 50))
        return stackView
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
        
        label.text = ": ?개"
        label.font = .B20
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
    
    // 대여/반납/구매 버튼
    let rentLabel1: UILabel = {
        var label = UILabel()
        
        label.text = "손님에게"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let rentLabel2: UILabel = {
        var label = UILabel()
        
        label.text = "우산을"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let rentLabel3: UILabel = {
        var label = UILabel()
        
        label.text = "빌려줄래요"
        label.font = .B20
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var rentLabelVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.rentLabel1, self.rentLabel2, self.rentLabel3])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    
    lazy var rentButton: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 159).isActive = true
        view.heightAnchor.constraint(equalToConstant: 156).isActive = true
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(named: "light")
        view.addSubview(rentLabelVStackView)
        rentLabelVStackView.centerX(inView: view)
        rentLabelVStackView.centerY(inView: view)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerRentVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    let returnLabel1: UILabel = {
        var label = UILabel()
        
        label.text = "손님이"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let returnLabel2: UILabel = {
        var label = UILabel()
        
        label.text = "우산을"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let returnLabel3: UILabel = {
        var label = UILabel()
        
        label.text = "반납했어요"
        label.font = .B20
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var returnLabelVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.returnLabel1, self.returnLabel2, self.returnLabel3])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.backgroundColor = .clear
        
        return stackView
    }()
    
    lazy var returnButton: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 159).isActive = true
        view.heightAnchor.constraint(equalToConstant: 156).isActive = true
        view.layer.cornerRadius = 30
        view.backgroundColor = UIColor(named: "light")
        view.addSubview(returnLabelVStackView)
        returnLabelVStackView.centerX(inView: view)
        returnLabelVStackView.centerY(inView: view)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerReturnVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.rentButton, self.returnButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 24

        return stackView
    }()
    
    let buyLabel: UILabel = {
        var label = UILabel()
        
        label.text = "손님에게 중고 우산을 구매해요"
        label.font = .SB16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var buyButton: UIView = {
       let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 342).isActive = true
        view.heightAnchor.constraint(equalToConstant: 69).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "main")
        view.addSubview(buyLabel)
        buyLabel.centerX(inView: view)
        buyLabel.centerY(inView: view)
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToOwnerBuyVC))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        configureUI()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(vStackView)
        view.addSubview(umbrellaHStackView)
        view.addSubview(buttonHStackView)
        view.addSubview(buyButton)
        
        vStackView.anchor(top: view.topAnchor, paddingTop: 69)
        vStackView.centerX(inView: view)
        umbrellaHStackView.anchor(top: vStackView.bottomAnchor, paddingTop: 50)
        umbrellaHStackView.centerX(inView: view)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 65)
        buttonHStackView.centerX(inView: view)
        buyButton.anchor(top: buttonHStackView.bottomAnchor, paddingTop: 15)
        buyButton.centerX(inView: view)
        
    }
    
    // TODO: 우산 대여가능 여부 체크
    func checkRentAvailable(availableNum: Int) {
        if availableNum == 0 {
            rentButton.isUserInteractionEnabled = false
            rentButton.backgroundColor = UIColor(named: "gray00")
        } else {
            rentButton.isUserInteractionEnabled = true
            rentButton.backgroundColor = UIColor(named: "light")
        }
    }
    
    // 사장님 Rent 페이지로 이동
    @objc func goToOwnerRentVC() {
        let rentVC = Owner_Rental_ReturnVC()
        rentVC.nowFun = "Rental"
        self.navigationController?.pushViewController(rentVC, animated: true)
    }
    
    // 사장님 Return 페이지로 이동
    @objc func goToOwnerReturnVC() {
        let returnVC = Owner_Rental_ReturnVC()
        returnVC.nowFun = "Return"
        self.navigationController?.pushViewController(returnVC, animated: true)
    }
    
    // 사장님 Buy 페이지로 이동
    @objc func goToOwnerBuyVC() {
        let buyVC = Owner_Rental_ReturnVC()
        buyVC.nowFun = "Buy"
        self.navigationController?.pushViewController(buyVC, animated: true)
    }
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func postData() {
        let umbrellaCnt: editUmbrellaModel = editUmbrellaModel(count: 1)
        HomeManager.shared.editUmbrella(editUmbrellaData: umbrellaCnt) { result in
            switch result {
            case .success(let data):
                if data["check"] as? Bool == true {
                    print("우산 \(umbrellaCnt.count)개 추가등록이 완료되었습니다.")
                }
            case .failure(let error):
                print(error)
                return
            }
        }
        
    }
    
    func fetchData() {
        HomeManager.shared.owner_getStore() { result in
            switch result {
            case .success(let data):
                print("본인 매장 조회")
                print(data) // 데이터 확인용
                self.nameLabel.text = data.information.shopName
                self.addressLabel.text = data.information.roadNameAddress
                self.umbrellaNum = data.information.availableUmbrella
                self.tag2Label.text = ": " + String(self.umbrellaNum) + "개"
                self.checkRentAvailable(availableNum: data.information.availableUmbrella)
            case .failure(let error):
                print("본인 매장 조회 에러\n\(error)")
            }
        }
    }
    
    
    
}
