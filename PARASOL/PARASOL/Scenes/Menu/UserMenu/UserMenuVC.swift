//
//  UserMenuVC.swift
//  PARASOL
//
//  Created by Jini on 2023/11/22.
//

import UIKit

class UserMenuVC: UIViewController {
    
    // MARK: [For Data]
    var rentalRecords: [RentalRecordInformation] = []
    
    var state: String = ""
    var startLo: String = ""
    var startTime: String = ""
    var end: String = ""
    var hours: Int = 0
    var numberOfRecordsToShow = 4
    
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
        label.font = .B24
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let umbrellaImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "umbrella_color"))
        imageview.setDimensions(height: 30, width: 29)
        
        return imageview
    }()
    
    let rentalLabel: UILabel = {
        let label = UILabel()
        label.text = "우산을 빌리러 갈까요?"
        label.font = .SB20
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var rentalButton: UIButton = {
        let button = UIButton()
        button.setTitle("바로 대여하러 가기", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.layer.cornerRadius = 20
        button.setDimensions(height: 50, width: 242)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .SB16
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 6
        
        let goToUserVCAction = UIAction { _ in
            let vc = UserTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        
        button.addAction(goToUserVCAction, for: .touchUpInside)
        
        return button
    }()
    
    let rentalStateLabel: UILabel = {
        let label = UILabel()
        label.text = "대여중"
        label.font = .B20
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let startLoLabel: UILabel = {
        let label = UILabel()
        label.text = "대여 매장"
        label.font = .R15
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    let startLoNameLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 이름"
        label.font = .SB18
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let startTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "대여 시작 시간"
        label.font = .R15
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "시작 시각"
        label.font = .SB18
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let recordView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "white")
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    let recordtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 우산 대여 기록"
        label.font = .SB18
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var viewStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.recordButton, self.arrowImage])
        stackview.axis = .horizontal
        stackview.spacing = 0
        stackview.alignment = .center
        
        return stackview
    }()
    
    lazy var recordButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor(named: "gray22"), for: .normal)
        button.titleLabel?.font = .B16
        
        let goTorecordVCAction = UIAction { _ in
            let recordVC = RecordVC()
            self.navigationController?.pushViewController(recordVC, animated: true)
        }
        
        button.addAction(goTorecordVCAction, for: .touchUpInside)
        
        return button
    }()
    
    lazy var arrowImage: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "arrow_gray"))
        imageview.setDimensions(height: 20, width: 20)
        
        return imageview
    }()
    
    lazy var RentalrecordStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 10
        
        return stackview
    }()
    
    var contentView: UIView = {
        let view = UIView()
       
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
    }
    
    // UI 설정들 관련 method
    func configureUI() {
        view.backgroundColor = UIColor(named: "light")
        
        view.addSubview(titleStackView)
        view.addSubview(recordView)
        
        recordView.addSubview(recordtitleLabel)
        recordView.addSubview(viewStackView)
        recordView.addSubview(contentView)
        
        titleStackView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 75, paddingLeft: 24)
        recordView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 235)
        
        recordtitleLabel.anchor(top: recordView.topAnchor, left: recordView.leftAnchor, paddingTop: 35, paddingLeft: 24)
        viewStackView.anchor(top: recordView.topAnchor, right: recordView.rightAnchor, paddingTop: 30, paddingRight: 24)
        contentView.anchor(top: recordView.topAnchor, left: recordView.leftAnchor, right: recordView.rightAnchor, paddingTop: 30, paddingLeft: 24, paddingRight: 24)
        
    }
    
    func createRecordStackview(date: String, location: String, state: String, timeDifference: Int) -> UIView {
        let dateLabel = UILabel()
        
        let maxDisplayLength = 10 // 최대 표시 길이
        if date.count > maxDisplayLength {
            let truncatedText = date.prefix(maxDisplayLength) // 초과하는 부분 생략
            dateLabel.text = String(transDateString1(dateString: String(truncatedText)))
        } else {
            dateLabel.text = date
        }
        dateLabel.font = .R16
        dateLabel.textColor = UIColor(named: "blackact")
        
        let umbrellaImage = UIImageView(image: UIImage(named: "umbrella_blue"))
        umbrellaImage.setDimensions(height: 28, width: 28)

        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.font = .R16
        locationLabel.textColor = UIColor(named: "blackact_opacity")
        
        let clockImage = UIImageView(image: UIImage(named: "clock"))
        clockImage.setDimensions(height: 19, width: 19)
        
        let stateLabel = UILabel()
        if state == "USE" {
            stateLabel.text = "대여중"
        } else if state == "CLEAR" {
            stateLabel.text = "\(timeDifference)시간 이용"
        }
        stateLabel.font = .M16
        stateLabel.textColor = UIColor(named: "black")
        
        let dlStackview = UIStackView(arrangedSubviews: [dateLabel, locationLabel])
        dlStackview.axis = .vertical
        dlStackview.alignment = .leading
        dlStackview.spacing = 5
        
        let recordStackview = UIStackView(arrangedSubviews: [dlStackview])
        recordStackview.axis = .horizontal
        recordStackview.alignment = .leading
        recordStackview.distribution = .fill
        recordStackview.spacing = 5
        
        let paddingContainerView = UIView()
        paddingContainerView.addSubview(recordStackview)
        paddingContainerView.addSubview(umbrellaImage)
        paddingContainerView.addSubview(clockImage)
        paddingContainerView.addSubview(stateLabel)
        paddingContainerView.backgroundColor = .clear
        
        umbrellaImage.anchor(top: paddingContainerView.topAnchor, left: paddingContainerView.leftAnchor, paddingTop: 15, paddingLeft: 8)
        
        recordStackview.translatesAutoresizingMaskIntoConstraints = false
        umbrellaImage.translatesAutoresizingMaskIntoConstraints = false
        clockImage.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            umbrellaImage.topAnchor.constraint(equalTo: paddingContainerView.topAnchor, constant: 15),
            umbrellaImage.leadingAnchor.constraint(equalTo: paddingContainerView.leadingAnchor, constant: 8),
            umbrellaImage.widthAnchor.constraint(equalToConstant: 28),
            umbrellaImage.heightAnchor.constraint(equalToConstant: 28),
            
            recordStackview.topAnchor.constraint(equalTo: paddingContainerView.topAnchor, constant: 8),
            recordStackview.leadingAnchor.constraint(equalTo: umbrellaImage.trailingAnchor, constant: 15),
            recordStackview.trailingAnchor.constraint(equalTo: paddingContainerView.trailingAnchor, constant: -140),
            recordStackview.bottomAnchor.constraint(equalTo: paddingContainerView.bottomAnchor, constant: -8),

            clockImage.topAnchor.constraint(equalTo: paddingContainerView.topAnchor, constant: 8),
            clockImage.leadingAnchor.constraint(equalTo: recordStackview.trailingAnchor, constant: 20),
            clockImage.widthAnchor.constraint(equalToConstant: 19),
            clockImage.heightAnchor.constraint(equalToConstant: 19),

            stateLabel.topAnchor.constraint(equalTo: paddingContainerView.topAnchor, constant: 8),
            stateLabel.leadingAnchor.constraint(equalTo: clockImage.trailingAnchor, constant: 5),
            stateLabel.trailingAnchor.constraint(equalTo: paddingContainerView.trailingAnchor, constant: -15),
        ])
        
        let containerView = UIView()
        containerView.addSubview(paddingContainerView)
        containerView.backgroundColor = UIColor(named: "light_opacity")
        containerView.setDimensions(height: 76, width: 342)
        containerView.layer.cornerRadius = 20
        
        
        paddingContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            paddingContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            paddingContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            paddingContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            paddingContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        
        return containerView
    }
    
    func transDateString1(dateString: String) -> String {
        // DateFormatter를 사용하여 날짜 문자열을 Date로 변환
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            // Date를 "yyyy년 MM월 dd일" 형식으로 변환
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "yyyy년 MM월 dd일"
            let displayString = displayFormatter.string(from: date)

            // Label에 표시
            return displayString
        } else {
            return "null"
        }
    }
    
    func transDateString2(dateString: String) -> String {
        // DateFormatter를 사용하여 날짜 문자열을 Date로 변환
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        if let date = dateFormatter.date(from: dateString) {
            // Date를 "yyyy년 MM월 dd일" 형식으로 변환
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
            let displayString = displayFormatter.string(from: date)

            // Label에 표시
            return displayString
        } else {
            return "null"
        }
    }
    
    func calculateTimeGap(from startDate: String, to endDate: String) -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let startDate = dateFormatter.date(from: startDate),
           let endDate = dateFormatter.date(from: endDate) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour], from: startDate, to: endDate)
            
            if let calculatedHours = components.hour {
                print(calculatedHours)
                return calculatedHours
            }
        }
        
        return nil
    }
    
    func showView() {
        if state == "USE" || state == "DELAY" {
            
            view.addSubview(rentalStateLabel)
            view.addSubview(startLoLabel)
            view.addSubview(startLoNameLabel)
            view.addSubview(startTimeTitleLabel)
            view.addSubview(startTimeLabel)
            
            rentalStateLabel.anchor(top: titleStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 24)
            startLoLabel.anchor(top: rentalStateLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 23, paddingLeft: 24)
            startLoNameLabel.anchor(top: startLoLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 3, paddingLeft: 24)
            startTimeTitleLabel.anchor(top: startLoNameLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 23, paddingLeft: 24)
            startTimeLabel.anchor(top: startTimeTitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 3, paddingLeft: 24)
            
            // Check if there is at least one rental record
            if let firstRecord = rentalRecords.first {
                let sdate = String(firstRecord.createdAt.prefix(10)).replacingOccurrences(of: "-", with: "/")
                let srangeStartIndex = firstRecord.createdAt.index(firstRecord.createdAt.startIndex, offsetBy: 11)
                let srangeEndIndex = firstRecord.createdAt.index(firstRecord.createdAt.startIndex, offsetBy: 16)
                let stime = firstRecord.createdAt[srangeStartIndex ..< srangeEndIndex]
                let sdatetime = "\(sdate) \(stime)"
                
                // Update labels with information from the first record
                startLoNameLabel.text = firstRecord.fromShop
                startTimeLabel.text = transDateString2(dateString: sdatetime)
            }
            
        }
        else {
            view.addSubview(rentalLabel)
            view.addSubview(rentalButton)
            
            rentalLabel.anchor(top: titleStackView.bottomAnchor, left: view.leftAnchor, right:view.rightAnchor, paddingTop: 51.5, paddingLeft: 107, paddingRight: 107)
            rentalButton.anchor(top: rentalLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 74, paddingRight: 74)
        }
        
        recordView.addSubview(RentalrecordStackview)
        
        RentalrecordStackview.anchor(top: recordtitleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 24, paddingLeft: 24, paddingRight: 24)
        RentalrecordStackview.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
    }
    
    // 날짜에 1일 더하기
    func addOneDayToDate(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
            
            if let modifiedDate = modifiedDate {
                return dateFormatter.string(from: modifiedDate)
            }
        }
        
        return nil
    }
    
    func fetchData() {
        MenuManager.shared.user_getRentalList { result in
            switch result {
            case .success(let data):
                self.rentalRecords.removeAll()
                for rentalrecord in data.information {
                    self.rentalRecords.append(RentalRecordInformation.init(member: rentalrecord.member,
                                                                           fromShop: rentalrecord.fromShop,
                                                                           endShop: rentalrecord.endShop,
                                                                           createdAt: rentalrecord.createdAt,
                                                                           clearedAt: rentalrecord.clearedAt,
                                                                           process: rentalrecord.process))
                }
                
                for record in self.rentalRecords {
                    if record.process == "USE" {
                        self.state = "USE"
                        self.startLo = record.fromShop
                        self.startTime = record.createdAt
                        break
                    } else if record.process == "CLEAR" {
                        self.state = "CLEAR"
                        break
                    }
                }
                
                DispatchQueue.main.async {
                    self.updateUIWithRentalRecords()
                    self.showView()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func updateUIWithRentalRecords() {
        var recordsAdded = 0
        
        for record in self.rentalRecords {
            let sdate = String(record.createdAt.prefix(10)).replacingOccurrences(of: "-", with: "/")
            let srangeStartIndex = record.createdAt.index(record.createdAt.startIndex, offsetBy: 11)
            let srangeEndIndex = record.createdAt.index(record.createdAt.startIndex, offsetBy: 16)
            let stime = record.createdAt[srangeStartIndex ..< srangeEndIndex]
            let sdatetime = "\(sdate) \(stime)"
            print(sdatetime)
            
            let edate = String(record.clearedAt.prefix(10)).replacingOccurrences(of: "-", with: "/")
            let erangeStartIndex = record.clearedAt.index(record.clearedAt.startIndex, offsetBy: 11)
            let erangeEndIndex = record.clearedAt.index(record.clearedAt.startIndex, offsetBy: 16)
            let etime = record.clearedAt[erangeStartIndex ..< erangeEndIndex]
            let edatetime = "\(edate) \(etime)"
            print(edatetime)
            
            if let timeDifference = calculateTimeGap(from: sdatetime, to: edatetime) {
                
                if recordsAdded < numberOfRecordsToShow {
                    let recordView = self.createRecordStackview(date: record.createdAt, location: record.fromShop, state: record.process, timeDifference: timeDifference)
                    self.RentalrecordStackview.addArrangedSubview(recordView)
                    recordsAdded += 1
                } else {
                    break
                }
            }
        }
    }

}
