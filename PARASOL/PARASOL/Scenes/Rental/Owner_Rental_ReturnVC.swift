//
//  Owner_Rental_ReturnVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/06.
//

import UIKit

class Owner_Rental_ReturnVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // 대여/반납 페이지 종류 결정 변수
    var nowFun = "Rental"

    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // MARK: [UI components]
    var cameraImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "camera")
        imageView.setDimensions(height: 100, width: 100)
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        
        label.text = "손님이 보유한 QR코드를\n인식해주세요."

        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        if nowFun == "Rental" {
            button.setTitle("대여완료", for: .normal)
        } else if nowFun == "Return" {
            button.setTitle("반납완료", for: .normal)
        } else if nowFun == "Buy" {
            button.setTitle("구매완료", for: .normal)
        }
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 30, width: 100)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "main")
        
        let goToDoneVCAction = UIAction { _ in
            let doneVC = DoneVC()
            doneVC.nowFun = self.nowFun
            doneVC.nowUser = "사장님"
            self.navigationController?.pushViewController(doneVC, animated: true)
        }
            
        button.addAction(goToDoneVCAction, for: .touchUpInside)
        
        return button
    }()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // method - setting navigation bar
    func setNavigationBar() {
        if nowFun == "Rental" {
            self.navigationItem.title = "대여하기"
        } else if nowFun == "Return" {
            self.navigationItem.title = "반납하기"
        } else if  nowFun == "Buy" {
            self.navigationItem.title = "구매하기"
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(cameraImage)
        view.addSubview(guideLabel)
        
        cameraImage.anchor(top: view.topAnchor, paddingTop: 353)
        cameraImage.centerX(inView: view)
        guideLabel.anchor(top: cameraImage.bottomAnchor, paddingTop: 50)
        guideLabel.centerX(inView: view)
        
        // testing done page
        view.addSubview(button)
        button.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
