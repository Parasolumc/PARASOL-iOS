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
    var shopId = 0

    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // MARK: [For Transition]
    var timer: Timer?
    var timerCount = 0
    var totalTimerCount = 6
    
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
    var qrGeneratedDate: String = ""
    
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
        
        let goToDoneVCAction = UIAction { [self] _ in
            isComplete(nowFun: nowFun, qrGeneratedDate: qrGeneratedDate, memberId: UserDefaults.standard.value(forKey: "memberId") as! Int, shopId: shopId)
        }
            
        button.addAction(goToDoneVCAction, for: .touchUpInside)
        
        return button
    }()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qrGeneratedDate = (getCurrentTime())["date"]!
        
        configureUI()
        setNavigationBar()
//        sellPostData()
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(doCheck), userInfo: nil, repeats: true)
        
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
        
//        testing done page
//        view.addSubview(button)
//        button.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    func createQRImage(url: String) {
        let frame = CGRect(origin: .zero, size: QRImage.frame.size)
        let qrcode = QRCodeView(frame: frame)

        qrcode.generateCode(url, foregroundColor: UIColor(named: "white")!, backgroundColor: UIColor(named: "black")!)

        QRImage.addSubview(qrcode)
        qrcode.anchor(top: QRImage.topAnchor, left: QRImage.leftAnchor, bottom: QRImage.bottomAnchor, right: QRImage.rightAnchor)
    }
    
    @objc func goToBeforeVCFunc() {
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: true, completion: nil)
    }
    
    // TODO: 현재 시간 가져오기
    func getCurrentTime() -> [String : String] {
        let date = Date()
        let dateFormatter = DateFormatter()
                
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let qrDate = dateFormatter.string(from: date)
        
        return ["date": qrDate]
    }
    
    // TODO: 시간 비교하기
    func compareDates(qrGeneratedDate: String, alarmDate: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date1 = dateFormatter.date(from: qrGeneratedDate),
           let date2 = dateFormatter.date(from: alarmDate) {
            
            if date1 < date2 {
                return true
            } else if date1 > date2 {
                return false
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    // TODO: 24시간 더하기
    func convertDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let newDate = calendar.date(byAdding: .hour, value: 24, to: date)
            
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
            return dateFormatter.string(from: newDate ?? Date())
        }
        
        return nil
    }

    @objc func doCheck() {
        timerCount += 1
        if timerCount >= totalTimerCount {
            timer?.invalidate()
            timer = nil
        } else {
            isComplete(nowFun: nowFun, qrGeneratedDate: qrGeneratedDate, memberId: UserDefaults.standard.value(forKey: "memberId") as! Int, shopId: shopId)
        }
        
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
    
    func isComplete(nowFun: String, qrGeneratedDate: String, memberId: Int, shopId: Int) {
        AlarmManager.shared.getAlarmList() { [self] result in
            switch result {
            case .success(let data):
                print("알람 조회 성공")
                print(data.information[data.information.count-1])
                let compareData = data.information[data.information.count-1]
                if nowFun == "Rental" && compareData.content == "대여를 완료했어요!"
                    && self.compareDates(qrGeneratedDate: qrGeneratedDate, alarmDate: compareData.sentTime)
                    && memberId == compareData.recipientId && shopId == compareData.shopId {
                    // 타이머 종료
                    timer?.invalidate()
                    timer = nil
                    // 화면 전환
                    let doneVC = DoneVC()
                    doneVC.nowFun = self.nowFun
                    doneVC.nowUser = "일반"
                    doneVC.freeRentDate = convertDate(compareData.sentTime)!
                    self.navigationController?.pushViewController(doneVC, animated: true)
                } else if nowFun == "Return" && compareData.content == "반납을 완료했어요!"
                            && self.compareDates(qrGeneratedDate: qrGeneratedDate, alarmDate: compareData.sentTime)
                            && memberId == compareData.recipientId && shopId == compareData.shopId {
                    // 타이머 종료
                    timer?.invalidate()
                    timer = nil
                    // 화면 전환
                    let doneVC = DoneVC()
                    doneVC.nowFun = self.nowFun
                    doneVC.nowUser = "일반"
                    self.navigationController?.pushViewController(doneVC, animated: true)
                }
            case .failure(let error):
                print("알람 조회 에러\n\(error)")
            }
        }
    }

}
