//
//  UserVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit

class UserVC: UIViewController, UISearchBarDelegate {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet

    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // toolbar 사이즈
    lazy var toolbarBounds = self.navigationController!.navigationBar.bounds
    lazy var toolbarHeight = toolbarBounds.height
    
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [UI components]
    // 검색 바 요소들
    let searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.placeholder = "검색"
        searchbar.tintColor = .blue
        searchbar.setImage(UIImage(named: "search"), for: UISearchBar.Icon.search, state: .normal)
        searchbar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        
        return searchbar
    }()
    
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
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
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
        
        label.text = "서울 서대문구 이화여대길 77"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업종료"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "09:00에 영업 시작"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
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
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
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
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
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
        stackView.spacing = 31

        return stackView
    }()
    
    // 지도 마커 버튼
    lazy var mapMarkButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "umbrella"), for: .normal)
        button.setTitle(" 9", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 44, width: 60)
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "main")
        
        let showAction = UIAction { _ in
            self.showStoreInfo()
            }
            
        button.addAction(showAction, for: .touchUpInside)
        
        return button
    }()
    
    // 시연 영상 찍고 지우기
    lazy var mapMarkButton2: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "umbrella"), for: .normal)
        button.setTitle(" 5", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 44, width: 60)
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "main")
        
        let showAction = UIAction { _ in
            self.showStoreInfo()
            }
            
        button.addAction(showAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var mapMarkButton3: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "umbrella"), for: .normal)
        button.setTitle(" 3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 44, width: 60)
        button.layer.cornerRadius = 22
        button.backgroundColor = UIColor(named: "main")
        
        let showAction = UIAction { _ in
            self.showStoreInfo()
            }
            
        button.addAction(showAction, for: .touchUpInside)
        
        return button
    }()
    
    var Label: UILabel = {
        let label = UILabel()
        
        label.text = "네이버 지도 곧 연결 예정"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
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
    func configureUI() {
//        view.backgroundColor = .white
        view.backgroundColor = UIColor(named: "light")
        
        view.addSubview(mapMarkButton)
        mapMarkButton.centerY(inView: view)
        mapMarkButton.centerX(inView: view)
        
        // 시연 영상 찍고 지우기
        view.addSubview(mapMarkButton2)
        mapMarkButton2.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 500, paddingLeft: 78)
        view.addSubview(mapMarkButton3)
        mapMarkButton3.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 600, paddingLeft: 200)
        view.addSubview(Label)
        Label.anchor(bottom: mapMarkButton.topAnchor, paddingBottom: 20)
        Label.centerX(inView: view)
        
    }
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor(named: "black")
        
        // 네비게이션 바의 배경 이미지를 투명하게 설정
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    
        searchBar.delegate = self
        searchBarSearchButtonClicked(searchBar)
        
        // 서치바 넣기
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
              
        // 서치바 커스텀
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = UIColor(named: "white")
            //플레이스홀더 글씨 색 정하기
//            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor(named: "black")
            textfield.layer.cornerRadius = 18
            textfield.clipsToBounds = true
        }
        
        // 알림 벨 넣기
        setNCRB()
    }
    
    // 알림 벨 세팅
    func setNCRB() {
        // right bar item
        let rightCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 28.0, height: 28.0))
        
        let bellImage: UIImageView = {
            let imageView = UIImageView()
            
            imageView.image = UIImage(named: "bell")
            
            imageView.contentMode = .scaleToFill
            imageView.setDimensions(height: 28.0, width: 28.0)
            
            return imageView
        }()
        
        rightCustomView.addSubview(bellImage)
        bellImage.translatesAutoresizingMaskIntoConstraints = false
        
        let rightBarItem = UIBarButtonItem(customView: rightCustomView)
        self.navigationItem.rightBarButtonItem = rightBarItem
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Left Image Tapped!")
        guard let searchText = searchBar.text else { return }
        print(searchText)
        if searchText != "" {
            let SearchVC = SearchVC()
            self.navigationController?.pushViewController(SearchVC, animated: true)
        }
        searchBar.resignFirstResponder() // 키보드를 닫습니다.
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // 왼쪽 이미지를 눌렀을 때의 액션 처리
        if let leftView = searchBar.subviews.first?.subviews.compactMap({ $0 as? UITextField }).first?.leftView as? UIImageView {
            let touchPoint = leftView.convert(CGPoint.zero, to: searchBar)
            if searchBar.bounds.contains(touchPoint) {
                // 왼쪽 이미지를 눌렀을 때 실행될 코드
                print("Left Image Tapped!")
                return false // 이미지를 눌렀을 때 서치바의 텍스트 변경을 방지
            }
        }
        return true
    }
    
    func showStoreInfo() {
        view.addSubview(introView)
        introView.addSubview(vStackView)
        introView.addSubview(findLoadButton)
        introView.addSubview(umbrellaHStackView)
        introView.addSubview(buttonHStackView)
        
        introView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor)
        vStackView.anchor(top: introView.topAnchor, paddingTop: 41)
        vStackView.centerX(inView: introView)
        findLoadButton.anchor(top: introView.topAnchor, right: introView.rightAnchor, paddingTop: 37, paddingRight: 40)
        umbrellaHStackView.anchor(top: vStackView.bottomAnchor, paddingTop: 38)
        umbrellaHStackView.centerX(inView: introView)
        buttonHStackView.anchor(top: umbrellaHStackView.bottomAnchor, paddingTop: 34)
        buttonHStackView.centerX(inView: introView)
        
        introView.alpha = 0.0 // 초기에 투명 상태로 설정
        introView.isHidden = false // 뷰를 보이도록 설정

        // 애니메이션 적용
        UIView.animate(withDuration: 1, animations: {
            self.introView.alpha = 1.0 // 뷰를 완전히 보이도록 알파값을 변경
        })
    }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}
