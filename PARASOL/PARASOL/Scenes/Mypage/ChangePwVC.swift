//
//  ChangePwVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/17.
//


import UIKit

class ChangePwVC: UIViewController {
    
    let currentpwLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 비밀번호"
        label.font = .M16
        
        return label
    }()
    
    let newpwLabel: UILabel = {
        let label = UILabel()
        label.text = "새 비밀번호"
        label.font = .M16
        
        return label
    }()
    
    let renewpwLabel: UILabel = {
        let label = UILabel()
        label.text = "새 비밀번호 확인"
        label.font = .M16
        
        return label
    }()
    
    let currentpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        textfield.isSecureTextEntry = true
        
        return textfield
    }()
    
    let newpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        textfield.isSecureTextEntry = true
        
        return textfield
    }()
    
    let renewpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        textfield.isSecureTextEntry = true
        
        return textfield
    }()
    
    let currentpwLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let newpwLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()
    
    let renewpwLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "gray")
        view.setDimensions(height: 1, width: 342)
        
        return view
    }()

    
    let confirmBtn: UIButton = {
        let button = UIButton()
        button.setTitle("변경완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 342)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.titleLabel?.font = .SB16
        
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
        confirmBtn.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "비밀번호 변경"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(currentpwLabel)
        view.addSubview(currentpwTf)
        view.addSubview(currentpwLineView)
        view.addSubview(newpwLabel)
        view.addSubview(newpwTf)
        view.addSubview(newpwLineView)
        view.addSubview(renewpwLabel)
        view.addSubview(renewpwTf)
        view.addSubview(renewpwLineView)
        view.addSubview(confirmBtn)
        
        
        currentpwLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 25)
        currentpwTf.anchor(top: currentpwLabel.bottomAnchor,left: view.leftAnchor, paddingTop: 10, paddingLeft: 25)
        currentpwTf.setDimensions(height: 35, width: 250)
        currentpwLineView.anchor(top: currentpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25)
        
        newpwLabel.anchor(top: currentpwTf.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 25)
        newpwTf.anchor(top: newpwLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 25)
        newpwTf.setDimensions(height: 35, width: 250)
        newpwLineView.anchor(top: newpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25)
        
        renewpwLabel.anchor(top: newpwTf.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 25)
        renewpwTf.anchor(top: renewpwLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 25)
        renewpwTf.setDimensions(height: 35, width: 250)
        renewpwLineView.anchor(top: renewpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25)
        
        confirmBtn.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20)
        confirmBtn.centerX(inView: view.self)

    }
    
    @objc func confirmButtonTapped() {
        postData()
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "비밀번호 변경 성공", message: "비밀번호가 성공적으로 변경되었습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            let vc = UserTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showError1Alert() {
        let alert = UIAlertController(title: "비밀번호 변경 실패", message: "새 비밀번호와 확인용 비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            // 닫기
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showError2Alert() {
        let alert = UIAlertController(title: "비밀번호 변경 실패", message: "비밀번호는 8~12자리 영문과 숫자 조합이어야 합니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            // 닫기
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    func postData() {
        guard let oldPassword = currentpwTf.text,
              let newPassword = newpwTf.text,
              let reNewPassword = renewpwTf.text,
              !oldPassword.isEmpty,
              !newPassword.isEmpty,
              !reNewPassword.isEmpty else {
            print("모든 필드를 입력해주세요.")
            return
        }
        
        // 비밀번호 일치 확인
        if newPassword != reNewPassword {
            self.showError1Alert()
            return
        }
        
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,12}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordPredicate.evaluate(with: newPassword) {
            self.showError2Alert()
            return
        }
        
        let changeData: ChangePwModel = ChangePwModel(oldPw: oldPassword, newPw: newPassword, reNewPw: reNewPassword, refreshToken: UserDefaults.standard.value(forKey: "refreshToken") as! String)
        MypageManager.shared.changePassword(changePwData: changeData) { result in
            switch result {
            case .success(let response):
                if response["check"] as? Bool == true {
                    print("비밀번호 변경 성공")
                    self.showSuccessAlert()
                } else {
                    print("비밀번호 변경 실패")
                }
            case .failure(let error):
                print(error)
                return
            }
        }
    }
    
}
