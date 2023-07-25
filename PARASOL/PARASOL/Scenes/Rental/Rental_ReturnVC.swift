//
//  Rental_ReturnVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/25.
//

import UIKit

class Rental_ReturnVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    var nowFun = "Rental"

    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // MARK: [UI components]
    var QRImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .lightGray
        imageView.setDimensions(height: 240, width: 240)
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    let QRLabel: UILabel = {
        let label = UILabel()
        
        label.text = "QR Code"
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        
        if nowFun == "Rental" {
            label.text = "대여를 원하시면 QR코드를 \n사장님께 보여주세요."
        } else if nowFun == "Return" {
            label.text = "반납을 원하시면 QR코드를 \n사장님께 보여주세요."
        }
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
        }
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 30, width: 100)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "main")
        
        let goToDoneVCAction = UIAction { _ in
            let doneVC = DoneVC()
            doneVC.nowFun = self.nowFun
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
        setNC()
        
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // method - setting navigation bar
    func setNC() {
        if nowFun == "Rental" {
            self.navigationItem.title = "대여하기"
        } else if nowFun == "Return" {
            self.navigationItem.title = "반납하기"
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(QRImage)
        QRImage.addSubview(QRLabel)
        view.addSubview(guideLabel)
        
        QRImage.anchor(top: view.topAnchor, paddingTop: 250)
        QRImage.centerX(inView: view)
        QRLabel.centerX(inView: QRImage)
        QRLabel.centerY(inView: QRImage)
        guideLabel.anchor(top: QRImage.bottomAnchor, paddingTop: 50)
        guideLabel.centerX(inView: view)
        
        // testing done page
        view.addSubview(button)
        button.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
