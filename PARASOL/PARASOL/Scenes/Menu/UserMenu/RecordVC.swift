//
//  RecordVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/29.
//

import UIKit

// 대여 기록 데이터 모델
struct RentalRecord {
    var date: String
    var location: String
    var state: Int
}

class RecordVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var date = "2023년 6월 5일"
    var location = "홍익문고"
    var state = 1 //대여중   반납완료:0

    // MARK: [UI components]

    /*let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.setDimensions(height: 81, width: 342)
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.date)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.location)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        return label
    }()
    
    lazy var clockImage: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "clock"))
        imageview.setDimensions(height: 19, width: 19)
        
        return imageview
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.text = "대여중"
        label.font = UIFont.systemFont(ofSize: 16)
        //상태에 따라 케이스 나누기 (미구현)
        
        return label
    }()
    
    lazy var dlStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.dateLabel, self.locationLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.spacing = 10
        
        return stackview
    }()
    
    lazy var stateStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.clockImage, self.stateLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.spacing = 9
        
        return stackview
    }()
    
    lazy var recordStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.dlStackview, self.stateStackview])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.spacing = 9
        
        return stackview
    }()*/
    
    lazy var RentalrecordStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 10
        
        return stackview
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
        let rentalRecords: [RentalRecord] = [
            //RentalRecord(date: "2023년 6월 5일", location: "홍익문고", state: 1),
            //RentalRecord(date: "2023년 6월 9일", location: "동대문구", state: 0)
            // 다른 대여 기록 데이터들도 추가
        ]
        
        for record in rentalRecords {
            let recordView = createRecordStackview(date: record.date, location: record.location, state: record.state)
            RentalrecordStackview.addArrangedSubview(recordView)  // RentalrecordStackview에 추가
        }
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "대여기록"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
         
        /*view.addSubview(backgroundView)
        backgroundView.addSubview(recordStackview)
        view.addSubview(RentalrecordStackview)
        
        backgroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 24)
        
        recordStackview.anchor(top: backgroundView.topAnchor, left: view.leftAnchor, paddingTop: 18, paddingLeft: 50)*/
        
        view.addSubview(RentalrecordStackview)
        
        RentalrecordStackview.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 24)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func createRecordStackview(date: String, location: String, state: Int) -> UIView {
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let clockImage = UIImageView(image: UIImage(named: "clock"))
        clockImage.setDimensions(height: 19, width: 19)
        
        let stateLabel = UILabel()
        if state == 1 {
            stateLabel.text = "대여중"
        } else if state == 0 {
            stateLabel.text = "48시간 이용"
        }
        stateLabel.font = UIFont.systemFont(ofSize: 16)
        
        let dlStackview = UIStackView(arrangedSubviews: [dateLabel, locationLabel])
        dlStackview.axis = .horizontal
        dlStackview.alignment = .leading
        dlStackview.spacing = 10
        
        let stateStackview = UIStackView(arrangedSubviews: [clockImage, stateLabel])
        stateStackview.axis = .horizontal
        stateStackview.alignment = .leading
        stateStackview.spacing = 9
        
        let recordStackview = UIStackView(arrangedSubviews: [dlStackview, stateStackview])
        recordStackview.axis = .vertical
        recordStackview.alignment = .leading
        recordStackview.distribution = .fill
        recordStackview.spacing = 5
        
        let paddingContainerView = UIView()
        paddingContainerView.addSubview(recordStackview)
        paddingContainerView.backgroundColor = .clear
        
        recordStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recordStackview.topAnchor.constraint(equalTo: paddingContainerView.topAnchor, constant: 8),
            recordStackview.leadingAnchor.constraint(equalTo: paddingContainerView.leadingAnchor, constant: 12),
            recordStackview.trailingAnchor.constraint(equalTo: paddingContainerView.trailingAnchor, constant: -12),
            recordStackview.bottomAnchor.constraint(equalTo: paddingContainerView.bottomAnchor, constant: -8)
        ])
        
        let containerView = UIView()
        containerView.addSubview(paddingContainerView)
        containerView.backgroundColor = UIColor(named: "light")
        containerView.setDimensions(height: 81, width: 342)
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


}

// MARK: - Extensions



