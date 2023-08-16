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
    
    // MARK: [UI components]
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
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
        addPics(pics: self.testURL)
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // UI 레이아웃 세팅
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        view.addSubview(findLoadButton)
        view.addSubview(picsScrollView)
        picsScrollView.addSubview(picsStackView)
        view.addSubview(introduceLabel)
        view.addSubview(umbrellaHStackView)
        view.addSubview(buttonHStackView)
        
        vStackView.anchor(top: view.topAnchor, paddingTop: 79)
        vStackView.centerX(inView: view)
        findLoadButton.anchor(top: vStackView.topAnchor, right: vStackView.rightAnchor)
        
        picsScrollView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 17, paddingLeft: 25, paddingRight: 25)
        picsScrollView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        
        
        picsStackView.anchor(top: picsScrollView.topAnchor, left: picsScrollView.leftAnchor, bottom: picsScrollView.bottomAnchor, right: picsScrollView.rightAnchor)
        
        introduceLabel.anchor(top: picsScrollView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        umbrellaHStackView.anchor(top: introduceLabel.bottomAnchor, paddingTop: 50)
        umbrellaHStackView.centerX(inView: view)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 62)
        buttonHStackView.centerX(inView: view)
        
        
        
        
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

}
