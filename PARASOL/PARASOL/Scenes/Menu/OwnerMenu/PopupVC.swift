//
//  PopupVC.swift
//  PARASOL
//
//  Created by Jini on 2023/08/10.
//

import UIKit

class PopupVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.setDimensions(height: 200, width: 314)
        view.backgroundColor = .white
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 영업시간 설정"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    /*let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.locale = Locale(identifier: "ko_KR") // 한국 시간 표시를 위해 설정
        picker.minuteInterval = 15
        picker.addTarget(self, action: #selector(timePickerValueChanged), for: .valueChanged)
        
        return picker
    }()*/
    

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        view.backgroundColor = UIColor(named: "black_opacity")
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        //containerView.addSubview(timePicker)
        
        containerView.centerX(inView: view)
        containerView.centerY(inView: view)
        
        titleLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, paddingTop: 30, paddingLeft: 30) //30
        
        //timePicker.anchor(top: titleLabel.bottomAnchor, left: containerView.leftAnchor, paddingTop: 10, paddingLeft: 10)
        
        
        
    }
    
    @objc func timePickerValueChanged(sender: UIDatePicker) {
        let selectedTime = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let formattedTime = dateFormatter.string(from: selectedTime)
        
        // 이제 선택된 시간을 처리하거나 원하는 작업을 수행하세요.
        print("Selected Time: \(formattedTime)")
    }
    
    func closeButtonTapped(_ sender: Any) {
            self.dismiss(animated: false, completion: nil)
        }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}
