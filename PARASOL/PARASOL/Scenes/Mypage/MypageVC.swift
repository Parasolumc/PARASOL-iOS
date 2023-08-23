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
        label.font = .B24
        
        return label
    }()
    
    let title1: UILabel = {
        let label = UILabel()
        label.text = "관리"
        label.font = .M16
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    let title2: UILabel = {
        let label = UILabel()
        label.text = "이용약관"
        label.font = .M16
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    lazy var changePwLabel: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 변경", for: .normal)
        button.titleLabel?.font = .SB18
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let goToChangePwVCAction = UIAction { _ in
            let changepwVC = ChangePwVC()
            self.navigationController?.pushViewController(changepwVC, animated: true)
        }
        
        button.addAction(goToChangePwVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var logoutLabel: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.titleLabel?.font = .SB18
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let logOutAction = UIAction { _ in
            self.showLogoutAlert()
        }
        
        button.addAction(logOutAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var withdrawalLabel: UIButton = {
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.titleLabel?.font = .SB18
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let withDrawalAction = UIAction { _ in
            self.showwithdrawalAlert()
        }
        
        button.addAction(withDrawalAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var contractLabel: UIButton = {
        let button = UIButton()
        button.setTitle("이용약관", for: .normal)
        button.titleLabel?.font = .SB18
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        let goToContractVCAction = UIAction { _ in
            let contractVC = ContractVC()
            self.navigationController?.pushViewController(contractVC, animated: true)
        }
        
        button.addAction(goToContractVCAction, for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        //refreshtoken갱신
    }
    
    // UI 설정들 관련 method
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleLabel)
        view.addSubview(title1)
        view.addSubview(changePwLabel)
        view.addSubview(logoutLabel)
        view.addSubview(withdrawalLabel)
        view.addSubview(title2)
        view.addSubview(contractLabel)
        
        //titleLabel.anchor(top:view.topAnchor, left: view.leftAnchor, paddingTop: 75, paddingLeft: 24)
        
        titleLabel.anchor(top:view.topAnchor, paddingTop: 75)
        titleLabel.centerX(inView: view)
        title1.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 25)
        changePwLabel.anchor(top: title1.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 25, paddingRight: 25)
        logoutLabel.anchor(top: changePwLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 25, paddingRight: 25)
        withdrawalLabel.anchor(top: logoutLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 25, paddingRight: 25)
        
        title2.anchor(top: withdrawalLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 35, paddingLeft: 25)
        contractLabel.anchor(top: title2.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 25, paddingRight: 25)
        
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
