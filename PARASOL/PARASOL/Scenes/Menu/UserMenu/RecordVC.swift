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
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(RentalrecordStackview)
        
        RentalrecordStackview.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 24)
        
    }
    
    func createRecordStackview(date: String, location: String, state: String) -> UIView {
        let dateLabel = UILabel()
        
        let maxDisplayLength = 10 // 최대 표시 길이
        if date.count > maxDisplayLength {
            let truncatedText = date.prefix(maxDisplayLength) // 초과하는 부분 생략
            dateLabel.text = String(truncatedText)
        } else {
            dateLabel.text = date
        }
        dateLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        
        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        let clockImage = UIImageView(image: UIImage(named: "clock"))
        clockImage.setDimensions(height: 19, width: 19)
        
        let stateLabel = UILabel()
        if state == "USE" {
            stateLabel.text = "대여중"
        } else if state == "CLEAR" {
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
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
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
            let recordView = self.createRecordStackview(date: record.createdAt, location: record.fromShop, state: record.process)
            self.RentalrecordStackview.addArrangedSubview(recordView)
        }
    }
    
    // MARK: - Extensions
    
    
}
