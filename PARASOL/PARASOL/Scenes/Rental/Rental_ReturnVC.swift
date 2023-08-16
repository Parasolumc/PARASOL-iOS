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
    
    // 대여/반납/판매 페이지 종류 결정 변수
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
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        
        if nowFun == "Rental" {
            label.text = "대여를 원하시면 QR코드를 \n사장님께 보여주세요."
        } else if nowFun == "Return" {
            label.text = "반납을 원하시면 QR코드를 \n사장님께 보여주세요."
        } else if nowFun == "Sell" {
            label.text = "판매를 원하시면 QR코드를 \n사장님께 보여주세요."
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
        } else if nowFun == "Sell" {
            button.setTitle("판매완료", for: .normal)
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
        setNavigationBar()
        sellPostData()
        
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    // method - setting navigation bar
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        
        if nowFun == "Rental" {
            self.navigationItem.title = "대여하기"
        } else if nowFun == "Return" {
            self.navigationItem.title = "반납하기"
        } else if nowFun == "Sell" {
            self.navigationItem.title = "판매신청"
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(QRImage)
        createQRImage(url: "https://github.com/Parasolumc")
        view.addSubview(guideLabel)
        
        QRImage.anchor(top: view.topAnchor, paddingTop: 250)
        QRImage.centerX(inView: view)
        guideLabel.anchor(top: QRImage.bottomAnchor, paddingTop: 50)
        guideLabel.centerX(inView: view)
        
        // testing done page
        view.addSubview(button)
        button.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    func createQRImage(url: String) {
        let frame = CGRect(origin: .zero, size: QRImage.frame.size)
        let qrcode = QRCodeView(frame: frame)

        qrcode.generateCode(url, backgroundColor: UIColor(named: "black")!)

        QRImage.addSubview(qrcode)
        qrcode.anchor(top: QRImage.topAnchor, left: QRImage.leftAnchor, bottom: QRImage.bottomAnchor, right: QRImage.rightAnchor)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    func sellPostData() {
        let storeId: Int = 2
        MenuManager.shared.sellUmbrella(id: storeId) { result in
            switch result {
            case .success(let data):
                if data["check"] as? Bool == true {
                    print("판매가 완료되었습니다.")
                }
                else {
                    print("xx")
                }
            case .failure(let error):
                print(error)
                return
            }
        
        }
    }

}
