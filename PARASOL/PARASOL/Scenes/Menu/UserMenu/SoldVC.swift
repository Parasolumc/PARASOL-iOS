//
//  SoldVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/30.
//

import UIKit

class SoldVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    var date = "2023.06.07"
    var location = "신촌 홍익문고점"
    var num = 1

    // MARK: [UI components]
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 판매한 우산"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.date)
        label.font = UIFont.systemFont(ofSize: 16)
        
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
    
    lazy var infoStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.dateLabel, self.locationLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.spacing = 10
        stackview.distribution = .fill
        stackview.setDimensions(height: 25, width: 248)
        
        return stackview
    }()
    
    
    lazy var soldStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.infoStackView, self.numLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .leading
        stackview.spacing = 20
        
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
        label.textColor = .blue
        
        return label
    }()
    
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "내가 판매한 우산"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        view.addSubview(titleLabel)
        view.addSubview(soldStackView)
        view.addSubview(mycabonLabel)
        view.addSubview(earthImage)
        view.addSubview(cabonLabel)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 26, paddingBottom: 8)
        soldStackView.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 26)
        mycabonLabel.anchor(top: soldStackView.bottomAnchor, left: view.leftAnchor, paddingTop: 50, paddingLeft: 26)
        earthImage.anchor(top: mycabonLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 26)
        cabonLabel.anchor(top: mycabonLabel.bottomAnchor, left: earthImage.rightAnchor, paddingTop: 20, paddingLeft: 10)
        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}

// MARK: - Extensions
