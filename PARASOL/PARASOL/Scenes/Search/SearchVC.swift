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

    // MARK: [UI components]
    let searchTableView = UITableView()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func configureUI() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(SearchCell.self, forCellReuseIdentifier: cellID)
        
    
        view.addSubview(searchTableView)
        searchTableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
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

