//
//  SoldVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/30.
//

import UIKit

// 판매 기록 데이터 모델
struct SoldRecord {
    var date: String
    var location: String
    var num: Int
}

class SoldVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet

    // MARK: [UI components]
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 판매한 우산"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    /*lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.date)
        label.font = UIFont.systemFont(ofSize: 16)
        label.sizeToFit()
        
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.location)
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var numLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.num) + "개"
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var spacerView = UIView()
    
    lazy var infoStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.dateLabel, self.locationLabel, self.spacerView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.spacing = 8
        stackview.distribution = .fill
        //stackview.setDimensions(height: 25, width: 248)
        
        return stackview
    }()
    
    lazy var soldStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.infoStackView, self.numLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 20
        
        return stackview
    }()*/
    
    lazy var SoldrecordStackview: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 12
        
        return stackview
    }()
    
    
    let mycabonLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 절약한 탄소량"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var earthImage: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "earth"))
        //imageview.contentMode = .scaleAspectFit
        imageview.setDimensions(height: 24, width: 24)
        
        return imageview
    }()
    
    let cabonLabel: UILabel = {
        let label = UILabel()
        label.text = "3049 G"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: "blue")
        
        return label
    }()
    
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
        let soldRecords: [SoldRecord] = [
            SoldRecord(date: "2023.06.07", location: "신촌 카페플레이스점", num: 1),
            SoldRecord(date: "2023.07.07", location: "신촌 홍익문고점", num: 2)
            // 다른 판매 기록 데이터들도 추가
        ]
        
        for record in soldRecords {
            let recordView = createSoldStackview(date: record.date, location: record.location, num: record.num)
            SoldrecordStackview.addArrangedSubview(recordView)  // SoldrecordStackview에 추가
        }
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "내가 판매한 우산"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(titleLabel)
        view.addSubview(SoldrecordStackview)
        view.addSubview(mycabonLabel)
        view.addSubview(earthImage)
        view.addSubview(cabonLabel)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 26, paddingBottom: 8)
        SoldrecordStackview.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 26, paddingRight: 26)
        mycabonLabel.anchor(top: SoldrecordStackview.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 26)
        earthImage.anchor(top: mycabonLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 26)
        cabonLabel.anchor(top: mycabonLabel.bottomAnchor, left: earthImage.rightAnchor, paddingTop: 20, paddingLeft: 10)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

    func createSoldStackview(date: String, location: String, num: Int) -> UIView {
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        
        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.font = UIFont.systemFont(ofSize: 16)
        
        let numLabel = UILabel()
        numLabel.text = "\(num)개"
        numLabel.font = UIFont.systemFont(ofSize: 16)
        
    
        let infoStackView = UIStackView(arrangedSubviews: [dateLabel, locationLabel])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.axis = .horizontal
        infoStackView.alignment = .leading
        infoStackView.spacing = 8
        infoStackView.distribution = .equalSpacing
        
        let soldStackView = UIStackView(arrangedSubviews: [infoStackView, numLabel])
        soldStackView.translatesAutoresizingMaskIntoConstraints = false
        soldStackView.axis = .horizontal
        soldStackView.alignment = .center
        soldStackView.distribution = .equalSpacing
        soldStackView.spacing = 10
        soldStackView.setDimensions(height: 25, width: 305)
        
        return soldStackView
    }
}

// MARK: - Extensions
