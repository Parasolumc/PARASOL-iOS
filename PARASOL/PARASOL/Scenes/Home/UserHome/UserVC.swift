//
//  UserVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit
import NMapsMap

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
    
    // MARK: [For Data]
    var stores: [StoreListInformation] = []
    
    // MARK: [UI components]
    // 검색 바 요소들
    let searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        
        searchbar.placeholder = "검색"
        searchbar.searchTextField.setPlaceholder(color: UIColor(named: "gray22") ?? .gray)
        searchbar.searchTextField.textColor = UIColor(named: "black")
        searchbar.searchTextField.font = .M16
        searchbar.searchTextField.backgroundColor = UIColor(named: "white")
        searchbar.searchTextField.layer.cornerRadius = 20
        searchbar.searchTextField.clipsToBounds = true
        searchbar.tintColor = UIColor(named: "point")
        searchbar.setImage(UIImage(named: "search"), for: UISearchBar.Icon.search, state: .normal)
        searchbar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        // 서치바에 그림자 추가
        searchbar.layer.shadowColor = UIColor(named: "gray22")!.cgColor
        searchbar.layer.shadowOpacity = 0.4
        searchbar.layer.shadowOffset = CGSize(width: 0, height: 3)
        searchbar.layer.shadowRadius = 2
        
        return searchbar
    }()
    
    lazy var mapMarkButton: mapMarker = {
        let button = mapMarker(umbrellaNum)
        
        let showAction = UIAction { _ in
            self.showStoreInfo(id: 1)
            }

        button.addAction(showAction, for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNMap()
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // MARK: [Naver Map]
    func setNMap() {
        let mapView = NMFMapView()
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "light")
        
        view.addSubview(mapMarkButton)
        mapMarkButton.centerY(inView: view)
        mapMarkButton.centerX(inView: view)
        
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor(named: "black")
        
        // 네비게이션 바의 배경 이미지를 투명하게 설정
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    
        searchBar.delegate = self
        searchBarSearchButtonClicked(searchBar)
        
        // 서치바 넣기
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        
        // 네비게이션 바 아이템 넣기
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
            let root = SearchVC()
            let vc = UINavigationController(rootViewController: root) // 네비게이션 컨트롤러 추가
            root.searchText = searchText
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        searchBar.resignFirstResponder() // 키보드를 닫습니다.
    }
    
    func showStoreInfo(id: Int) {
        let vc = SumStoreInfoVC()
        present(vc, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func fetchData() {
        // 매장 리스트 조회
        HomeManager.shared.user_getStoreList { result in
            switch result {
            case .success(let data):
                print("매장 리스트 조회")
                print(data) // 데이터 확인용
                self.stores.removeAll()
                for store in data.information {
                    self.stores.append(StoreListInformation.init(id: store.id,
                                                                 shopName: store.shopName,
                                                                 latitude: store.latitude,
                                                                 longitude: store.longitude,
                                                                 roadNameAddress: store.roadNameAddress,
                                                                 openTime: store.openTime,
                                                                 closeTime: store.closeTime,
                                                                 availableUmbrella: store.availableUmbrella,
                                                                 unavailableUmbrella: store.unavailableUmbrella))

                }
                print(self.stores) // 데이터 확인용
            case .failure(let error):
                print("매장 리스트 조회 에러\n\(error)")
            }
        }
        
        // 매장 검색
        let searchedModel: SearchStoreModel = SearchStoreModel(keyword: "매장1", userLatitude: "37", userLongitude: "127")
        HomeManager.shared.searchStores(SearchStoreModel: searchedModel) { result in
            switch result {
            case .success(let data):
                print("매장 검색")
                print(data)
            case .failure(let error):
                print("매장 검색 에러\n\(error)")
            }
        }
        
        
    }

}
