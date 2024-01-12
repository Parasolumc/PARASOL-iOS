//
//  FindVC.swift
//  PARASOL
//
//  Created by 서주영 on 2024/01/07.
//

import UIKit

class FindVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width
    lazy var screenHeight = bounds.size.height
    
    let findIDBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("아이디 찾기", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 64, width: 195)
        btn.backgroundColor = UIColor(named: "white")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    let findPWBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("비밀번호 재설정", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 64, width: 195)
        btn.backgroundColor = UIColor(named: "white")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    lazy var findBtnStackView : UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.findIDBtn, self.findPWBtn])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fillProportionally
        stackview.spacing = 0
        stackview.setDimensions(height: 64, width: 390)
        
        return stackview
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(UIColor(named: "black"), for: .normal)
        btn.setDimensions(height: 72, width: 390)
        btn.backgroundColor = UIColor(named: "gray00")
        btn.clipsToBounds = true
        
        return btn
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configureUI()
        findIDBtnTapped()
        
        findIDBtn.addTarget(self, action: #selector(findIDBtnTapped), for: .touchUpInside)
        findPWBtn.addTarget(self, action: #selector(findPWBtnTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "ID/PW 찾기"
        
    }
    
    func configureUI() {
        self.view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(findBtnStackView)
        view.addSubview(nextButton)
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        findBtnStackView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 101.76, paddingLeft: 0, paddingRight: 0)
        nextButton.anchor(top: findBtnStackView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 606, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    @objc func findIDBtnTapped() {
        let findIDVC = FindIDVC()
        present(findIDVC, animated: true, completion: nil)
    }
    
    @objc func findPWBtnTapped() {
        let findPWVC = FindPWVC()
        present(findPWVC, animated: true, completion: nil)
    }

    // 버튼에 밑줄 추가하는 도우미 메서드
    private func addUnderlineToButton(button: UIButton) {
        let underlineView = UIView()
        underlineView.backgroundColor = UIColor(named: "main")
        button.addSubview(underlineView)
        underlineView.anchor(bottom: button.bottomAnchor, paddingBottom: 1, width: 195, height: 1)
    }

    // 버튼을 선택 해제하는 도우미 메서드
    private func deselectButton(selectedBtn: UIButton?) {
        // 버튼이 nil 인지 확인 (선택된 버튼이 없는 경우)
        guard let selectedBtn = selectedBtn else { return }

        // 이전에 선택된 버튼에서 밑줄 뷰 제거
        selectedBtn.subviews.forEach { $0.removeFromSuperview() }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}

