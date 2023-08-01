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
    

    var nowFun = "Rental"
    
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
        }
        label.font = .boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서울 서대문구 이화여대길 77"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
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
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        configureUI()
        doDismissVC()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        view.addSubview(doneLabel)
        view.addSubview(vStackView)
        
        logoImage.anchor(top: view.topAnchor, paddingTop: 250)
        logoImage.centerX(inView: view)
        doneLabel.anchor(top: logoImage.bottomAnchor, paddingTop: 20)
        doneLabel.centerX(inView: view)
        vStackView.anchor(top: doneLabel.bottomAnchor, paddingTop: 20)
        vStackView.centerX(inView: view)
    }
    
    func doDismissVC() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dismissFunc), userInfo: nil, repeats: false)
    }
    
    @objc func dismissFunc() {
        let root = UserVC()
        let vc = UINavigationController(rootViewController: root)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의


}
