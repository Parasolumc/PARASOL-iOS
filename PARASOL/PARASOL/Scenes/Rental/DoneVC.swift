//
//  DoneVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/25.
//

import UIKit

class DoneVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    

    var nowFun = "Rental" // 대여/반납/판매 중 어떤 페이지에서 넘어온 페이지인지 체크
    var nowUser = "일반" // 현재 사용자가 일반 사용자인지 사장님인지 체크
    var fee = 100
    
    // MARK: [UI components]
    var logoImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "rain_umbrella")
        imageView.setDimensions(height: 78.4, width: 78.4)
        
        return imageView
    }()
    
    lazy var doneLabel: UILabel = {
        let label = UILabel()
        
        if nowFun == "Rental" {
            label.text = "대여가 완료되었습니다"
        } else if nowFun == "Return" {
            label.text = "반납이 완료되었습니다"
        } else if nowFun == "Sell" {
            label.text = "판매가 완료되었습니다"
        }
        label.font = .B25
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .B16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서울 서대문구 이화여대길 77"
        label.font = .M16
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.addressLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        
//        stackView.setDimensions(height: 100, width: (screenWidth - 50))
        return stackView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        
        if (self.fee>0) && (self.nowFun=="Return") {
            label.text = "연체료 " + String(fee) + "원이\n자동 결제될 예정입니다."
        } else if self.nowFun == "Sell" {
            label.text = "우산 컨디션 확인 후 7-10일 이내\n고객님의 계좌에 금액이 자동입금됩니다."
        } else if self.nowFun == "Rental" {
            label.text = "~까지 무료\n초과시 1시간당 100씩 부과됩니다."
        }
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .B16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        configureUI()
        
        if nowUser == "일반" {
            goToUserHome()
        }else if nowUser == "사장님" {
            goToOwnerHome()
        }
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(logoImage)
        view.addSubview(doneLabel)
        view.addSubview(vStackView)
        view.addSubview(infoLabel)
        
        logoImage.anchor(top: view.topAnchor, paddingTop: 250)
        logoImage.centerX(inView: view)
        doneLabel.anchor(top: logoImage.bottomAnchor, paddingTop: 20)
        doneLabel.centerX(inView: view)
        vStackView.anchor(top: doneLabel.bottomAnchor, paddingTop: 20)
        vStackView.centerX(inView: view)
        infoLabel.anchor(bottom: view.bottomAnchor, paddingBottom: 92)
        infoLabel.centerX(inView: view)
    }
    
    func goToUserHome() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goToUserFunc), userInfo: nil, repeats: false)
    }
    
    @objc func goToUserFunc() {
        let vc = UserTabBarVC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    func goToOwnerHome() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(goToOwnerFunc), userInfo: nil, repeats: false)
    }
    
    @objc func goToOwnerFunc() {
        let vc = OwnerTabBarVC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의


}
