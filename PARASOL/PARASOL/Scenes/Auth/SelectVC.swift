//
//  SelectVC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/07/31.
//

import UIKit


class SelectVC : UIViewController {
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let selectNavigationBar : UINavigationBar = {
        let navigationbar = UINavigationBar()
        let backBtn = UIBarButtonItem(image: UIImage(named: "navigator"), style: .plain, target: SelectVC.self, action: nil)
        
        return navigationbar
    }()
    
    let selectLabel: UILabel = {
        let label = UILabel()
        label.text = "어떤 사용자이신가요?"
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let UserButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
    let OwnerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
    lazy var btnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.UserButton, self.OwnerButton])
            
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 24
        // 스택뷰 사이즈 조정
        stackView.setDimensions(height: 150, width: (screenWidth - 66))
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        var userConfig = UIButton.Configuration.plain()
        userConfig.title = "일반"
        userConfig.subtitle = "우산을 빌릴래요!"
        UserButton.configuration = userConfig
        
        var ownerConfig = UIButton.Configuration.plain()
        ownerConfig.title = "사장님"
        ownerConfig.subtitle = "우산을 빌려줄래요!"
        OwnerButton.configuration = ownerConfig
    }
    
    func configureUI() {
        
        view.addSubview(selectNavigationBar)
        view.addSubview(selectLabel)
        view.addSubview(btnStackView)
        
        self.view.backgroundColor = UIColor(named: "white")
        
        selectNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        UserButton.translatesAutoresizingMaskIntoConstraints = false
        OwnerButton.translatesAutoresizingMaskIntoConstraints = false
        btnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        selectNavigationBar.barTintColor = UIColor(named: "white")
        
        selectNavigationBar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        selectLabel.anchor(top: selectNavigationBar.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 147, paddingLeft: 118, width: 154, height: 21)
        
        btnStackView.anchor(top: selectLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 84, paddingLeft: 33)
    }
}
