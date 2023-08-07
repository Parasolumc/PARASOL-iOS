//
//  UserMenuVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/29.
//

import UIKit

class UserMenuVC: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 대여 현황"
        label.font = .boldSystemFont(ofSize: 25)
        
        return label
    }()
    
    let info: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "light")
        view.layer.cornerRadius = 30
        view.setDimensions(height: 272, width: 342)
        
        return view
    }()
    
    let statelabel: UILabel = {
        let label = UILabel()
        label.text = "2023/07/02 16:45 에 빌렸어요"
        label.font = .boldSystemFont(ofSize: 16)
        
        
        return label
    }()
    
    let freestatelabel: UILabel = {
        let label = UILabel()
        label.text = "2023/07/02 16:45 까지 반납하면 무료 !"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .blue
        
        
        return label
    }()
    
    let warninglabel: UILabel = {
        let label = UILabel()
        label.text = "24시간동안 우산 무료로 대여되며, 초과시 1시간당 \n100원의 연체료가 부과됩니다."
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .red
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var excesstimeStackView: UIStackView = { //노랑
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
    
    lazy var feeStackView: UIStackView = { //노랑
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
    
    lazy var stateStackView: UIStackView = { // 파란색
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
        
        /*let goTosellVCAction = UIAction { _ in
            let sellVC = SellVC()
            self.navigationController?.pushViewController(sellVC, animated: true)
        }
        
        button.addAction(goTosellVCAction, for: .touchUpInside)*/
        
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
    
    /*let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .gray
        
        return tableView
    }()
    
    let sections = ["관리"]
    let manageItems = ["결제수단", "대여기록"]*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // UI 설정들 관련 method
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleLabel)
        view.addSubview(info)
        info.addSubview(statelabel)
        info.addSubview(freestatelabel)
        info.addSubview(warninglabel)
        view.addSubview(stateStackView)
        view.addSubview(sellbutton)
        view.addSubview(soldbutton)
        view.addSubview(manageLabel)
        view.addSubview(payLabel)
        view.addSubview(rentalLabel)
        //view.addSubview(tableView)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingLeft: 24)
        
        info.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 24)
        
        statelabel.anchor(top: info.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
        
        freestatelabel.anchor(top: statelabel.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
        warninglabel.anchor(top: freestatelabel.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 60)
        
        stateStackView.centerX(inView: info)
        stateStackView.anchor(top: warninglabel.bottomAnchor, paddingTop: 40)
        
        sellbutton.anchor(top: info.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 24)
        soldbutton.anchor(top: sellbutton.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 24)
        
        sellbutton.centerX(inView: view)
        soldbutton.centerX(inView: view)
        manageLabel.anchor(top: soldbutton.bottomAnchor, left: view.leftAnchor, paddingTop: 40, paddingLeft: 24)
        payLabel.anchor(top: manageLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 24)
        rentalLabel.anchor(top: payLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 24)
        
        /*tableView.anchor(top: info.bottomAnchor, left: view.leftAnchor, paddingTop: 30, height: 200)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self*/
    }
    

}

/*extension UserMenuVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = manageItems[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}*/

