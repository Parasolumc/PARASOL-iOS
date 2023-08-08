//
//  SearchVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/18.
//

import UIKit

private let cellID = "SearchCell"

class SearchVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    var searchText:String = ""
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
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

}

// MARK: - Extensions
extension SearchVC: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchCell
        
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
    }
}

