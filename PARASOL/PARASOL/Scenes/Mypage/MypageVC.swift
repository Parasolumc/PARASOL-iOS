//
//  MypageVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/17.
//

import UIKit

class MypageVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "마이페이지"
        label.textColor = UIColor(named: "black")
        label.font = .B20
        
        return label
    }()
    
    let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        
        return tableview
    }()
    
    let sections = ["계정 관리", "이용약관"]
    let accountItems = ["비밀번호 변경", "로그아웃", "회원 탈퇴"]
    let termsItems = ["이용약관"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        //refreshtoken갱신
    }
    
    // UI 설정들 관련 method
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.anchor(top:view.topAnchor, paddingTop: 75)
        titleLabel.centerX(inView: view)
        
        tableView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 15, paddingRight: 10)

        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func showLogoutAlert() {
        let alert = UIAlertController(title: "로그아웃하시겠습니까?", message: "로그아웃을 해도 정보가 삭제되지 않습니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        let logoutAction = UIAlertAction(title: "네", style: .destructive) { _ in
            self.performLogout()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(logoutAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showwithdrawalAlert() {
        let alert = UIAlertController(title: "정말 계정을 삭제하시겠습니까?", message: "현재 미반납 우산이 있거나, 지불하지 않은 연체료가 있는 고객님은 탈퇴가 불가능합니다.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        let withdrawalAction = UIAlertAction(title: "네", style: .destructive) { _ in
            self.performWithdrawal()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(withdrawalAction)
        present(alert, animated: true, completion: nil)
    }
    
    func logoutshowSuccessAlert() {
        let alert = UIAlertController(title: "로그아웃 성공", message: "로그아웃에 성공했습니다. \n첫 화면으로 돌아갑니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            let root = LoginVC()
            let vc = UINavigationController(rootViewController: root) // 네비게이션 컨트롤러 추가
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func logoutshowFailureAlert() {
        let alert = UIAlertController(title: "로그아웃 실패", message: "로그아웃에 실패했습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func withdrawalshowSuccessAlert() {
        let alert = UIAlertController(title: "회원 탈퇴 성공", message: "회원 탈퇴에 성공했습니다. \n첫 화면으로 돌아갑니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            let root = LoginVC()
            let vc = UINavigationController(rootViewController: root) // 네비게이션 컨트롤러 추가
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func withdrawalshowFailureAlert() {
        let alert = UIAlertController(title: "회원 탈퇴 실패", message: "회원 탈퇴에 실패했습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func setUserDefaultsInitial() {
        UserDefaults.standard.set("", forKey: "accessToken")
        UserDefaults.standard.set("", forKey: "refreshToken")
        UserDefaults.standard.set("", forKey: "role")
        UserDefaults.standard.set("", forKey: "memberId")
    }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    func performLogout() {
        let refreshToken: LogoutModel = LogoutModel(refreshToken: UserDefaults.standard.value(forKey: "refreshToken") as! String )
        MypageManager.shared.logOut(logOutData: refreshToken) { result in
            switch result {
            case .success(let data):
                if data["check"] as? Bool == true {
                    print("로그아웃되었습니다.")
                    self.setUserDefaultsInitial()
                    self.logoutshowSuccessAlert()
                }
                else {
                    print("로그아웃에 실패했습니다.")
                }
            case .failure(let error):
                print(error)
                return
            }
        
        }
    }
    
    func performWithdrawal() {
        MypageManager.shared.withDrawal { result in
            switch result {
            case .success(let data):
                if data["check"] as? Bool == true {
                    print("회원 탈퇴 성공")
                    self.setUserDefaultsInitial()
                    self.withdrawalshowSuccessAlert()
                } else {
                    print("회원 탈퇴 실패")
                    self.withdrawalshowFailureAlert()
                }
            case .failure(let error):
                print(error)
                return
            }
        
        }
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
            cell.textLabel?.font = .SB18
        } else if indexPath.section == 1 {
            cell.textLabel?.text = termsItems[indexPath.row]
            cell.textLabel?.font = .SB18
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
