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
    
    let QRReader = QRReaderView()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // QR 리더 기능 시작
        if !self.QRReader.isRunning {
            self.QRReader.start()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        setQRReader()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // QR 리더 기능 중지
        if self.QRReader.isRunning {
            self.QRReader.stop(isButtonTap: false)
        }
        
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
    
    func setQRReader() {
        self.QRReader.delegate = self
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(QRReader)
        view.addSubview(guideLabel)
        
        let LRPadding = (screenWidth-240)/2
        QRReader.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 250, paddingLeft: LRPadding, paddingRight: LRPadding)
        guideLabel.anchor(top: view.topAnchor, paddingTop: 250+240+50)
        guideLabel.centerX(inView: view)
        
        // qr reader에 corner radius를 넣어야 할 때
//        let BPadding = screenHeight - (250 + 240 + 45 + 56)
//        QRReader.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 250, paddingLeft: LRPadding, paddingBottom: BPadding, paddingRight: LRPadding)
//        guideLabel.anchor(top: QRReader.bottomAnchor, paddingTop: 50)
//        guideLabel.centerX(inView: view)
        
        // testing done page
        view.addSubview(button)
        button.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}

extension Owner_Rental_ReturnVC: ReaderViewDelegate {
    func readerComplete(status: ReaderStatus) {
        
        var title = ""
        var message = ""
        switch status {
        case let .success(code):
            guard let code = code else {
                title = "에러"
                message = "QR코드 or 바코드를 인식하지 못했습니다.\n다시 시도해주세요."
                break
            }

            title = "알림"
            message = "인식성공\n\(code)"
        case .fail:
            title = "에러"
            message = "QR코드 or 바코드를 인식하지 못했습니다.\n다시 시도해주세요."
        case let .stop(isButtonTap):
            if isButtonTap {
                title = "알림"
                message = "바코드 읽기를 멈추었습니다."
            } else {
                return
            }
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
    
