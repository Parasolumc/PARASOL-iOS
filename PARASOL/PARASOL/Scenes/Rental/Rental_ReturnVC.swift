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
    
    // MARK: [For Transition]
    let transition: CATransition = {
        let transition = CATransition()
        
        transition.duration = 0.4
        transition.type = .push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        return transition
    }()
    
    // MARK: [UI components]
    var beforeView: String = "" // SumStoreInfoVC or StoreInfoVC or UserMenuVC
    
    let stringMemberId: String = String(UserDefaults.standard.value(forKey: "memberId") as! Int)
    
    var QRImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = UIColor(named: "gray00")
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
        label.font = .B16
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
//        sellPostData()
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
        
        if beforeView == "SumStoreInfoVC" {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "white")
            // 네비게이션 바 뒤로가기 아이템 넣기
            setNCLB()
        }
    }
    
    // 네비게이션 바 왼쪽 아이템 세팅
    func setNCLB() {
        // left bar item
        let leftCustomView = UIView(frame: CGRect(x: 0, y: 0, width: 25.0, height: 25.0))

        let navigatorArrow: UIImageView = {
            let imageView = UIImageView()

            imageView.image = UIImage(named: "navigator")

            imageView.contentMode = .scaleToFill
            imageView.setDimensions(height: 25.0, width: 25.0)

            imageView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToBeforeVCFunc))
            imageView.addGestureRecognizer(tapGesture)

            return imageView
        }()

        leftCustomView.addSubview(navigatorArrow)
        navigatorArrow.translatesAutoresizingMaskIntoConstraints = false

        let leftBarItem = UIBarButtonItem(customView: leftCustomView)
        self.navigationItem.leftBarButtonItem = leftBarItem
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(QRImage)
        createQRImage(url: stringMemberId)
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

        qrcode.generateCode(url, foregroundColor: UIColor(named: "black")!, backgroundColor: UIColor(named: "white")!)

        QRImage.addSubview(qrcode)
        qrcode.anchor(top: QRImage.topAnchor, left: QRImage.leftAnchor, bottom: QRImage.bottomAnchor, right: QRImage.rightAnchor)
    }
    
    @objc func goToBeforeVCFunc() {
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: true, completion: nil)
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
