//
//  MypageVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/17.
//

import UIKit

class MypageVC: UIViewController {
    
    //let navigationController = UINavigationController(rootViewController: ViewController())
    
    
    
    let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .insetGrouped)
        
        return tableview
    }()
    
    let sections = ["계정 관리", "이용약관"]
    let accountItems = ["비밀번호 변경", "로그아웃", "회원 탈퇴"]
    let termsItems = ["이용약관"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
    }
    
    // UI 설정들 관련 method
    
    func setNavigationBar() {
        self.navigationItem.title = "마이페이지"
    }
    
    func configureUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)

        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /*@objc func alarmButtonTapped() {
        
    }*/
    
    func showLogoutAlert() {
        let alert = UIAlertController(title: "로그아웃하시겠습니까?", message: "로그아웃을 해도 정보가 삭제되지 않습니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "네", style: .destructive) { _ in
            // 로그아웃 처리
        }
        
        alert.addAction(cancelAction)
        alert.addAction(logoutAction) //순서 안 바뀜
        present(alert, animated: true, completion: nil)
    }
    
    func showwithdrawalAlert() {
        let alert = UIAlertController(title: "정말 계정을 삭제하시겠습니까?", message: "현재 미반납 우산이 있거나, 지불하지 않은 연체료가 있는 고객님은 탈퇴가 불가능합니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        let withdrawalAction = UIAlertAction(title: "네", style: .destructive) { _ in
            // 탈퇴 처리
        }
        
        alert.addAction(cancelAction)
        alert.addAction(withdrawalAction) //순서 안 바뀜
        present(alert, animated: true, completion: nil)
    }
    

}

extension MypageVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return accountItems.count
        } else if section == 1 {
            return termsItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = accountItems[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = termsItems[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 0 { // "비밀번호 변경" 셀을 눌렀을 때
                let changepwVC = ChangePwVC()
                self.navigationController?.pushViewController(changepwVC, animated: true)
            } else if indexPath.row == 1 { // "로그아웃" 셀을 눌렀을 때
                showLogoutAlert() // 로그아웃 팝업 표시
            } else if indexPath.row == 2 { // "회원탈퇴" 셀을 눌렀을 때
                showwithdrawalAlert() // 탈퇴 팝업 표시
            }
        } else if indexPath.section == 1 {
            // 이용약관 셀의 동작 구현
            let contractVC = ContractVC()
            self.navigationController?.pushViewController(contractVC, animated: true)
            
        }
    }
    
}

