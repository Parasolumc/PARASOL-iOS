//
//  Mypage_ChangepwVC.swift
//  parasolpw
//
//  Created by Jini on 2023/07/17.
//


import UIKit

class ChangePwVC: UIViewController {
    
    let currentpwLabel: UILabel = {
        let label = UILabel()
        label.text = "현재 비밀번호"
        
        return label
    }()
    
    let newpwLabel: UILabel = {
        let label = UILabel()
        label.text = "새 비밀번호"
        
        return label
    }()
    
    let renewpwLabel: UILabel = {
        let label = UILabel()
        label.text = "새 비밀번호 확인"
        
        return label
    }()
    
    let currentpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        
        return textfield
    }()
    
    let newpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        
        return textfield
    }()
    
    let renewpwTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.placeholder = "8-12자리 영문, 숫자 조합"
        
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
        
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI() // UI 메소드 정의
        setNavigationBar()
        
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "비밀번호 변경"
    }
    
    func configureUI() {
        
        view.addSubview(currentpwLabel)
        view.addSubview(currentpwTf)
        view.addSubview(currentpwLineView) // 밑줄 뷰 추가
        view.addSubview(newpwLabel)
        view.addSubview(newpwTf)
        view.addSubview(newpwLineView) // 밑줄 뷰 추가
        view.addSubview(renewpwLabel)
        view.addSubview(renewpwTf)
        view.addSubview(renewpwLineView) // 밑줄 뷰 추가
        view.addSubview(confirmBtn)
        
        
        
        currentpwLineView.translatesAutoresizingMaskIntoConstraints = false
        newpwLineView.translatesAutoresizingMaskIntoConstraints = false
        renewpwLineView.translatesAutoresizingMaskIntoConstraints = false
        
        
        currentpwLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 30,
                              paddingLeft: 25)
        currentpwTf.anchor(top: currentpwLabel.bottomAnchor,
                              left: view.leftAnchor,
                              paddingTop: 10,
                              paddingLeft: 25)
        currentpwTf.setDimensions(height: 35, width: 250)
        currentpwLineView.anchor(top: currentpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25) // 밑줄 뷰 제약조건 추가
        newpwLabel.anchor(top: currentpwTf.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 30,
                              paddingLeft: 25)
        newpwTf.anchor(top: newpwLabel.bottomAnchor,
                              left: view.leftAnchor,
                              paddingTop: 10,
                              paddingLeft: 25)
        newpwTf.setDimensions(height: 35, width: 250)
        newpwLineView.anchor(top: newpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25) // 밑줄 뷰 제약조건 추가
        renewpwLabel.anchor(top: newpwTf.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 30,
                              paddingLeft: 25)
        renewpwTf.anchor(top: renewpwLabel.bottomAnchor,
                              left: view.leftAnchor,
                              paddingTop: 10,
                              paddingLeft: 25)
        renewpwTf.setDimensions(height: 35, width: 250)
        renewpwLineView.anchor(top: renewpwTf.bottomAnchor, left: view.leftAnchor, paddingLeft: 25) // 밑줄 뷰 제약조건 추가
        confirmBtn.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          paddingBottom: 20)
        confirmBtn.centerX(inView: view.self)
        
        
        
        /*//barButtonSystemItem 알람 이미지로 대체하기
        let alarmButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(alarmButtonTapped))
                
        navItem.rightBarButtonItems = [alarmButton]*/
        
            

    }

    
    /*@objc func alarmButtonTapped() {
         
        }*/
    
}
