//
//  UserMenuVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/29.
//

import UIKit

class UserMenuVC: UIViewController {
    
    // MARK: [For Data]
    var rentalRecords: [RentalRecordInformation] = []
    
    var state: String = ""
    var start: String = ""
    var end: String = ""
    
    lazy var titleStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.titleLabel, self.umbrellaImageView])
        stackview.axis = .horizontal
        stackview.spacing = 8
        stackview.alignment = .center
        
        return stackview
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 우산"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    let umbrellaImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "umbrella_color"))
        imageview.setDimensions(height: 30, width: 29)
        
        return imageview
    }()
    
    
    let info: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.layer.cornerRadius = 30
        view.setDimensions(height: 272, width: 342)
        
        return view
    }()
    
    lazy var statelabel: UILabel = {
        let label = UILabel()
        if state == "USE" { // 대여중인 상태
            let date = String(start.prefix(10)).replacingOccurrences(of: "-", with: "/")
            let rangeStartIndex = start.index(start.startIndex, offsetBy: 11)
            let rangeEndIndex = start.index(start.startIndex, offsetBy: 16)
            let time = start[rangeStartIndex ..< rangeEndIndex]
            
            label.text = "\(date) \(time) 에 빌렸어요"
            label.font = .boldSystemFont(ofSize: 16)
        }
        else { // 대여중이 아닌 상태
            label.text = "아직 빌린 우산이 없어요!"
            label.font = .boldSystemFont(ofSize: 16)
        }
        
        return label
    }()
    
    lazy var freestatelabel: UILabel = {
        let label = UILabel()
        label.text = String(self.end) + " 까지 반납하면 무료! (추가예정)" //위의 date에서 1일 더하기
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .blue
        
        
        return label
    }()
    
    lazy var rentalbutton: UIButton = {
        let button = UIButton()
        button.setTitle("바로 대여하러 가기", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.cornerRadius = 20
        button.setDimensions(height: 45, width: 242)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let goToUserVCAction = UIAction { _ in
            let vc = UserTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        
        button.addAction(goToUserVCAction, for: .touchUpInside)
        
        return button
    }()
    
    let warninglabel: UILabel = {
        let label = UILabel()
        label.text = "24시간동안 우산 무료로 대여되며, 초과시 1시간당 \n100원의 연체료가 부과됩니다."
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .red
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var excesstimeStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.label1, self.timeStackView])
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.alignment = .center
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "초과시간"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    lazy var timeStackView: UIStackView = { //초록
        let stackView = UIStackView(arrangedSubviews: [self.timeImageView, self.timeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    let timeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clock"))
        
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "3시간"
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var feeStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.label2, self.moneyStackView])
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.alignment = .center
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "연체료"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return label
    }()
    
    lazy var moneyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.moneyImageView, self.moneylabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let moneyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "money"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let moneylabel: UILabel = {
        let label = UILabel()
        
        label.text = "300원"
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var stateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.excesstimeStackView, self.feeStackView])
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var sellbutton: UIButton = {
        let button = UIButton()
        button.setTitle("안 쓰는 우산 판매하기", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.cornerRadius = 20
        button.setDimensions(height: 45, width: 342)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let goToSellVCAction = UIAction { _ in
            let rentalVC = Rental_ReturnVC()
            rentalVC.nowFun = "Sell"
            self.navigationController?.pushViewController(rentalVC, animated: true)
            }
            
        button.addAction(goToSellVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var soldbutton: UIButton = {
        let button = UIButton()
        button.setTitle("내가 판매한 우산", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.cornerRadius = 20
        button.setDimensions(height: 45, width: 342)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let goTosoldVCAction = UIAction { _ in
            let soldVC = SoldVC()
            self.navigationController?.pushViewController(soldVC, animated: true)
        }
        
        button.addAction(goTosoldVCAction, for: .touchUpInside)
        
        return button
    }()
    
    let manageLabel: UILabel = {
        let label = UILabel()
        label.text = "관리"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    lazy var payLabel: UIButton = {
        let button = UIButton()
        button.setTitle("결제수단", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        
        let goTopaywayVCAction = UIAction { _ in
            let paywayVC = PaywayVC()
            self.navigationController?.pushViewController(paywayVC, animated: true)
        }
        
        button.addAction(goTopaywayVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var rentalLabel: UIButton = {
        let button = UIButton()
        button.setTitle("대여기록", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        
        let goTorecordVCAction = UIAction { _ in
            let recordVC = RecordVC()
            self.navigationController?.pushViewController(recordVC, animated: true)
        }
        
        button.addAction(goTorecordVCAction, for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
    }
    
    // UI 설정들 관련 method
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleStackView)
        view.addSubview(info)

        view.addSubview(sellbutton)
        view.addSubview(soldbutton)
        view.addSubview(manageLabel)
        view.addSubview(payLabel)
        view.addSubview(rentalLabel)
        
        titleStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 24)
        
        info.anchor(top: titleStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 24)
        
        //showView()
        
        sellbutton.anchor(top: info.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 24)
        soldbutton.anchor(top: sellbutton.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 24)
        
        sellbutton.centerX(inView: view)
        soldbutton.centerX(inView: view)
        manageLabel.anchor(top: soldbutton.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 24)
        payLabel.anchor(top: manageLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 24)
        rentalLabel.anchor(top: payLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 24)
        
    }
    
    func showView() {
        if state == "USE" { // 대여중인 상태
            info.addSubview(statelabel)
            info.addSubview(freestatelabel)
            info.addSubview(warninglabel)
            view.addSubview(stateStackView)
            
            statelabel.anchor(top: info.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
            
            freestatelabel.anchor(top: statelabel.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
            warninglabel.anchor(top: freestatelabel.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
            
            stateStackView.centerX(inView: info)
            stateStackView.anchor(top: warninglabel.bottomAnchor, paddingTop: 40)
        }
        else { // 대여중이 아닌 상태
            info.addSubview(statelabel)
            view.addSubview(rentalbutton)
            
            statelabel.anchor(top: info.topAnchor, left: view.leftAnchor, paddingTop: 90, paddingLeft: 117)
            
            rentalbutton.anchor(top: statelabel.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 84)
            rentalbutton.centerX(inView: view)
        }
        
        
        
    }
    
    func fetchData() {
        MenuManager.shared.user_getRentalList { result in
            switch result {
            case .success(let data):
                print(data)
                self.rentalRecords.removeAll()
                for rentalrecord in data.information {
                    self.rentalRecords.append(RentalRecordInformation.init(member: rentalrecord.member,
                                                                           fromShop: rentalrecord.fromShop,
                                                                           endShop: rentalrecord.endShop,
                                                                           createdAt: rentalrecord.createdAt,
                                                                           clearedAt: rentalrecord.clearedAt,
                                                                           process: rentalrecord.process))
                }
                print(self.rentalRecords)
                
                for record in self.rentalRecords {
                    if record.process == "USE" {
                        self.state = "USE"
                        self.start = record.createdAt
                        break
                    } else if record.process == "CLEAR" {
                        self.state = "CLEAR"
                        break
                    }
                }
                
                DispatchQueue.main.async {
                    self.showView()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }

}
