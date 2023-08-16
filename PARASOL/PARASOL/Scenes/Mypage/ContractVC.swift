//
//  ContractVC.swift
//  PARASOL
//
//  Created by Jini on 2023/07/24.
//

import UIKit

class ContractVC: UIViewController {
    
    lazy var arrowImageView1: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "arrow"))
        imageview.setDimensions(height: 18, width: 18)
        
        return imageview
    }()
    
    lazy var arrowImageView2: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "arrow"))
        imageview.setDimensions(height: 18, width: 18)
        
        return imageview
    }()
    
    lazy var arrowImageView3: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "arrow"))
        imageview.setDimensions(height: 18, width: 18)
        
        return imageview
    }()
    
    lazy var contractLabel1: UILabel = {
        let label = UILabel()
        label.text = "서비스 이용약관"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var cStackView1: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.contractLabel1, self.arrowImageView1])
        stackview.setDimensions(height: 40, width: 342)
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.spacing = 10
        stackview.alignment = .center
        
        return stackview
    }()
    
    lazy var contractLabel2: UILabel = {
        let label = UILabel()
        label.text = "개인정보수집/이용 동의"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var cStackView2: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.contractLabel2, self.arrowImageView2])
        stackview.setDimensions(height: 40, width: 342)
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.spacing = 10
        stackview.alignment = .center
        
        return stackview
    }()
    
    lazy var contractLabel3: UILabel = {
        let label = UILabel()
        label.text = "위치기반 서비스 이용약관 동의"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var cStackView3: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.contractLabel3, self.arrowImageView3])
        stackview.setDimensions(height: 40, width: 342)
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.spacing = 10
        stackview.alignment = .center
        
        return stackview
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(cStackView1Tapped))
        cStackView1.addGestureRecognizer(tapGesture1)
        cStackView1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(cStackView2Tapped))
        cStackView2.addGestureRecognizer(tapGesture2)
        cStackView2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(cStackView3Tapped))
        cStackView3.addGestureRecognizer(tapGesture3)
        cStackView3.isUserInteractionEnabled = true
    }
    
    @objc func cStackView1Tapped() {
        let contract1vc = Agreement1VC()
        self.navigationController?.pushViewController(contract1vc, animated: true)
    }
    
    @objc func cStackView2Tapped() {
        let contract2vc = Agreement2VC()
        self.navigationController?.pushViewController(contract2vc, animated: true)
    }
    
    @objc func cStackView3Tapped() {
        let contract3vc = Agreement3VC()
        self.navigationController?.pushViewController(contract3vc, animated: true)
    }
    
    // UI 설정들 관련 method
    func setNavigationBar() {
        self.navigationItem.title = "파라솔 이용약관"
    }
    
    func configureUI() {
        view.addSubview(cStackView1)
        view.addSubview(cStackView2)
        view.addSubview(cStackView3)
        
        cStackView1.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 24)
        cStackView2.anchor(top: contractLabel1.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 24)
        cStackView3.anchor(top: contractLabel2.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 24)
        
        
    }

   

}

