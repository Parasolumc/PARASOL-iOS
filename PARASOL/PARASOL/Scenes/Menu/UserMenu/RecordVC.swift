//
//  RecordVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/29.
//

import UIKit

class RecordVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    var timePass: Int = 0
    
    // MARK: [For Data]
    var rentalRecords: [RentalRecordInformation] = []
    
    // MARK: [UI components]
    lazy var RentalrecordStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 10
        
        return stackview
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchData()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "대여기록"
        // 네비게이션바 폰트 및 색상 설정
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "black")!, NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!]
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(scrollView)
        view.addSubview(RentalrecordStackview)
        
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 24, paddingBottom: 20, paddingRight: 24)
        scrollView.addSubview(RentalrecordStackview)
        scrollView.contentInsetAdjustmentBehavior = .never
        
        RentalrecordStackview.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor)

        RentalrecordStackview.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
    }
    
    func createRecordStackview(date: String, location: String, state: String, timeDifference: Int) -> UIView {
        //SoldVC.umbrellaCnt += 1
        let dateLabel = UILabel()
        
        let maxDisplayLength = 10 // 최대 표시 길이
        if date.count > maxDisplayLength {
            let truncatedText = date.prefix(maxDisplayLength) // 초과하는 부분 생략
            dateLabel.text = String(transDateString(dateString: String(truncatedText)))
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
    
    func transDateString(dateString: String) -> String {
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
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
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
                
                // 데이터를 가져온 후에 UI 업데이트 수행
                DispatchQueue.main.async {
                    self.updateUIWithRentalRecords()
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func updateUIWithRentalRecords() {
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
                print(timeDifference)
                let recordView = self.createRecordStackview(date: record.createdAt, location: record.fromShop, state: record.process, timeDifference: timeDifference)
                self.RentalrecordStackview.addArrangedSubview(recordView)
            }
        }
    }
    
    // MARK: - Extensions
    
    
}
