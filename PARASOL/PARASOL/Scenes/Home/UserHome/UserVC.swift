//
//  UserVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/17.
//

import UIKit
import NMapsMap
import CoreLocation

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
    
    // MARK: [For Requesting URLScheme]
    let appName: String = "com.PARASOL"
    
    // MARK: [For Map]
    lazy var mapView: NMFNaverMapView = {
        let mapView = NMFNaverMapView(frame: view.frame)
        
        mapView.mapView.positionMode = .direction
        mapView.mapView.logoAlign = .leftBottom
        
        mapView.showCompass = true // 나침반 모양
        mapView.showZoomControls = false // +, - 버튼
        mapView.showLocationButton = true //동그라미 버튼
        
        return mapView
    }()
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        // desiredAccuracy는 위치의 정확도를 설정함.
        // 높으면 배터리 많이 닳음.
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
     }()
    
    // MARK: [For Data]
    var stores: [StoreListInformation] = []
    
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // MARK: [UI components]
    // TODO: 검색 바 요소들
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        setCurrentPos()
        configureUI()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // MARK: - Naver 지도 열기 테스트
    func testOpen() {
        let url = URL(string: "nmap://map?&appname=\(appName)")!
        let appStoreURL = URL(string: "http://itunes.apple.com/app/id311867728?mt=8")!

        if UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        } else {
          UIApplication.shared.open(appStoreURL)
        }
    }
    
    // MARK: [Naver Map]
    // TODO: 네이버지도 생성 및 배치 method
    func setNMap() {
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        
        let marker = NMFMarker(position: NMGLatLng(lat: 37.487935, lng: 126.8544), iconImage: NMFOverlayImage(name: "map_marker"))
        marker.mapView = mapView.mapView
        marker.iconTintColor = UIColor(named: "black")!
        marker.width = 41
        marker.height = 44
        marker.userInfo = ["id": 1] // 저장한 값 사용시 타입캐스팅 해야 한다.
        print(marker.userInfo["id"] as! Int)
        
    }
    // TODO: 현재 위치 생성 method
    func setCurrentPos() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        getLocationUsagePermission()
        
    }
    // TODO: 전체 UI 배치 method
    func configureUI() {
        view.backgroundColor = UIColor(named: "light")
        
        setNMap()
        setNavigationBar()
        
    }
    // TODO: 네비게이션바 세팅(서치바 포함) method
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor(named: "black")
        
        // 네비게이션 바의 배경 이미지를 투명하게 설정
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    
        searchBar.delegate = self
        searchBarSearchButtonClicked(searchBar)
        
        // 서치바 넣기
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        // 네비게이션 바 아이템 넣기
        setNCRB()
    }
    // TODO: 네비게이션바 오른쪽 아이템 세팅 method
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
            
            // 매장 검색
            let lat = String(locationManager.location?.coordinate.latitude as? Double ?? 0)
            let long = String(locationManager.location?.coordinate.longitude as? Double ?? 0)
            let searchData: SearchStoreModel = SearchStoreModel(keyword: searchText, userLatitude: lat, userLongitude: long)
            
            // 검색 화면에 데이터 넘기기
            root.searchText = searchText
            root.searchStore = searchData
            
            // 화면 전환
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        searchBar.resignFirstResponder() // 키보드를 닫습니다.
    }
    // TODO: 매장 정보화면 present method
    func showStoreInfo(id: Int) {
        let vc = SumStoreInfoVC()
        present(vc, animated: true, completion: nil)
    }
    
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    // TODO: 데이터 세팅 method
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
        
    }

}

extension UserVC: CLLocationManagerDelegate {
    func getLocationUsagePermission() {
        //location4
        self.locationManager.requestWhenInUseAuthorization()

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //location5
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
            locationManager.startUpdatingLocation() // 중요!
            
            //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
            cameraUpdate.animation = .easeIn
            mapView.mapView.moveCamera(cameraUpdate)
            
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거부됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // the most recent location update is at the end of the array.
        let location: CLLocation = locations[locations.count - 1]
        let longtitude: CLLocationDegrees = location.coordinate.longitude
        let latitude:CLLocationDegrees = location.coordinate.latitude

        //현 위치로 카메라 이동
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
        cameraUpdate.animation = .easeIn
        mapView.mapView.moveCamera(cameraUpdate)
        
    }
}
