//
//  SearchVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/18.
//

import UIKit
import CoreLocation

private let cellID = "SearchCell"

class SearchVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    var searchText:String = ""
    
    // MARK: [For Location]
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        // desiredAccuracy는 위치의 정확도를 설정함.
        // 높으면 배터리 많이 닳음.
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        return manager
     }()
    
    // MARK: [For Data]
    var searchStore: SearchStoreModel = SearchStoreModel(keyword: "", userLatitude: "0", userLongitude: "0")
    var searchedStores: [SearchedStoreInformation] = [SearchedStoreInformation(id: 1, shopName: "상점명", roadNameAddress: "주우소", distance: "거리")]
    
    // MARK: [UI components]
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
    
    let searchTableView = UITableView()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 네비게이션 바 세팅
        setNavigationBar()
        // 데이터 불러오기
        fetchSearchData(keyword: searchText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//
//        navigationController?.navigationBar.isTranslucent = true
//    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func configureUI() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
        
        searchBar.delegate = self
    
        view.addSubview(searchTableView)
        searchTableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = UIColor(named: "white")
        navigationController?.navigationBar.isTranslucent = true
        
        // 서치바 넣기
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        
        // 서치바 검색어 세팅
        if searchText != "" {
            setSearchText(_searchText: searchText)
        }
        
        // 네비게이션 바 아이템 넣기
        setNCRB()
    }
    
    // 네비게이션 바 아이템 세팅
    func setNCRB() {
        // left bar item
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 25.0, height: 25.0))
        
        let navigatorArrow: UIImageView = {
            let imageView = UIImageView()
            
            imageView.image = UIImage(named: "navigator")
            
            imageView.contentMode = .scaleToFill
            imageView.setDimensions(height: 25.0, width: 25.0)
            
            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToUserFunc))
            imageView.addGestureRecognizer(tapGesture)
            
            return imageView
        }()
        
        leftCustomView.addSubview(navigatorArrow)
        navigatorArrow.translatesAutoresizingMaskIntoConstraints = false
        
        let leftBarItem = UIBarButtonItem(customView: leftCustomView)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    func setSearchText(_searchText: String) {
        searchBar.text = searchText
    }
    
    @objc func goToUserFunc() {
        let vc = UserTabBarVC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    // TODO: 매장 검색 데이터 불러오기
    func fetchSearchData(keyword: String) {
        // 매장 검색
        let lat = String(locationManager.location?.coordinate.latitude as? Double ?? 0)
        let lon = String(locationManager.location?.coordinate.longitude as? Double ?? 0)
        print("keyword: \(keyword), lat: \(lat), lon: \(lon)")
        self.searchStore = SearchStoreModel(keyword: keyword, userLatitude: lat, userLongitude: lon)
        HomeManager.shared.searchStores(SearchStoreModel: searchStore) { result in
            switch result {
            case .success(let data):
                print("매장 검색")
                print(data)
                self.searchedStores.removeAll()
                self.searchedStores = data.information
                self.searchTableView.reloadData()
            case .failure(let error):
                print("매장 검색 에러\n\(error)")
            }
        }
    }
    
}

// MARK: - Extensions
extension SearchVC: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedStores.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchCell
        
        cell.nameLabel.text = searchedStores[indexPath.row].shopName
        cell.addressLabel.text = searchedStores[indexPath.row].roadNameAddress
        cell.distanceLabel.text = searchedStores[indexPath.row].distance
        
        return cell
    }
}

extension SearchVC: UITableViewDelegate {
    // MARK: - Setting Size of Cells
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedId = searchedStores[indexPath.row].id
        
        let storeInfoVC = StoreInfoVC()
        storeInfoVC.storeId = selectedId
        self.navigationController?.pushViewController(storeInfoVC, animated: true)
    }
}

extension SearchVC: CLLocationManagerDelegate {
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
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let keyword = searchBar.text ?? ""
        fetchSearchData(keyword: keyword)
        searchTableView.reloadData()
    }
}
