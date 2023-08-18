//
//  PopupVC.swift
//  PARASOL
//
//  Created by Jini on 2023/08/10.
//

import UIKit
//import DropDown

class PopupVC: UIViewController {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    var dataCompletion: ((String, String, String) -> Void)?
    
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.setDimensions(height: 260, width: 314)
        view.backgroundColor = .white
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 영업시간 설정"
        label.font = .boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    let dayTextField: UITextField = {
        let textfield = UITextField()
        textfield.setDimensions(height: 35, width: 71)
        textfield.layer.cornerRadius = 5
        textfield.borderStyle = .roundedRect
        textfield.text = "월요일"
        textfield.font = .systemFont(ofSize: 13)
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 1
        textfield.textAlignment = .center
        
        return textfield
    }()
    
    let tagLabel1: UILabel = {
        let label = UILabel()
        label.text = "부터"
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    let tagLabel2: UILabel = {
        let label = UILabel()
        label.text = "까지"
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    let startTextField: UITextField = {
        let textfield = UITextField()
        textfield.setDimensions(height: 35, width: 71)
        textfield.layer.cornerRadius = 5
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "00:00"
        textfield.font = .systemFont(ofSize: 13)
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 1
        textfield.textAlignment = .center
        
        return textfield
    }()
    
    let endTextField: UITextField = {
        let textfield = UITextField()
        textfield.setDimensions(height: 35, width: 71)
        textfield.layer.cornerRadius = 5
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "23:59"
        textfield.font = .systemFont(ofSize: 13)
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 1
        textfield.textAlignment = .center
        
        return textfield
    }()
    
    /*let dayDropDown: DropDown = {
        let dropdown = DropDown()
        dropdown.dataSource = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
        dropdown.layer.cornerRadius = 5
        dropdown.dismissMode = .automatic
        
        return dropdown
    }()*/
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "main")
        button.setDimensions(height: 42, width: 114)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        button.backgroundColor = UIColor(named: "main")
        button.setDimensions(height: 42, width: 114)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    let dayPicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    let daysOfWeek: [String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일", "매일"]

    /*lazy var starttimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.minuteInterval = 30 // 30분 간격으로 설정
        picker.addTarget(self, action: #selector(starttimePickerValueChanged), for: .valueChanged)
        
        return picker
    }()
    
    lazy var endtimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.minuteInterval = 30 // 30분 간격으로 설정
        picker.addTarget(self, action: #selector(endtimePickerValueChanged), for: .valueChanged)
        
        return picker
    }()*/
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus_round"), for: .normal)
        button.setDimensions(height: 20, width: 20)
        //button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        return button
    }()
    

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        dayTextField.inputView = dayPicker
        //startTextField.inputView = starttimePicker
        //endTextField.inputView = endtimePicker
        dayPicker.delegate = self
        dayPicker.dataSource = self
        
        //startTextField.text = formatTime(starttimePicker.date)
        //endTextField.text = formatTime(endtimePicker.date)
        
        dayTextField.inputAccessoryView = createToolbarForPicker(selector: #selector(dismissPicker))
        //startTextField.inputAccessoryView = createToolbarForPicker(selector: #selector(dismissPicker))
        //endTextField.inputAccessoryView = createToolbarForPicker(selector: #selector(dismissPicker))
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        view.backgroundColor = UIColor(named: "black_opacity")
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        //containerView.addSubview(timePicker)
        containerView.addSubview(dayTextField)
        
        containerView.addSubview(tagLabel1)
        containerView.addSubview(tagLabel2)
        
        containerView.addSubview(startTextField)
        containerView.addSubview(endTextField)
        
        containerView.addSubview(plusButton)
        
        containerView.addSubview(cancelButton)
        containerView.addSubview(confirmButton)
        
        containerView.centerX(inView: view)
        //containerView.centerY(inView: view)
        containerView.anchor(top: view.topAnchor, paddingTop: 322)
        titleLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, paddingTop: 30, paddingLeft: 30) //30
        
        dayTextField.anchor(top:titleLabel.bottomAnchor, left: containerView.leftAnchor, paddingTop: 30, paddingLeft: 30)
        
        startTextField.anchor(top: dayTextField.bottomAnchor, left: containerView.leftAnchor, paddingTop: 10, paddingLeft: 30)
        
        tagLabel1.anchor(top: dayTextField.bottomAnchor, left: startTextField.rightAnchor, paddingTop: 19, paddingLeft: 5)
        
        endTextField.anchor(top: dayTextField.bottomAnchor, left: tagLabel1.rightAnchor, paddingTop: 10, paddingLeft: 20)
        
        tagLabel2.anchor(top: dayTextField.bottomAnchor, left: endTextField.rightAnchor, paddingTop: 19, paddingLeft: 5)
        
        plusButton.anchor(top: dayTextField.bottomAnchor, left: tagLabel2.rightAnchor, paddingTop: 18, paddingLeft: 20)
        
        cancelButton.anchor(left: containerView.leftAnchor, bottom: containerView.bottomAnchor, paddingLeft: 30, paddingBottom: 20)
        
        confirmButton.anchor(bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingBottom: 20,  paddingRight: 30)
        
    }
    
    /*func dropdownUI() {
        // DropDown View의 배경
        dropView.backgroundColor = UIColor(named: "white")
        
        DropDown.appearance().textColor = UIColor.black // 아이템 텍스트 색상
        DropDown.appearance().selectedTextColor = UIColor.black // 선택된 아이템 텍스트 색상
        DropDown.appearance().backgroundColor = UIColor.white // 아이템 팝업 배경 색상
        DropDown.appearance().selectionBackgroundColor = UIColor(named: "main") // 선택한 아이템 배경 색상
        DropDown.appearance().setupCornerRadius(8)
        
            
        tfInput.text = "선택해주세요." // 힌트 텍스트
            
        ivIcon.tintColor = UIColor.gray
    }*/
    
    @objc func cancelButtonTapped(sender: UIButton) {
        dismiss(animated: false, completion: nil) // 팝업 창 닫기
    }
    
    @objc func confirmButtonTapped(sender: UIButton) {
        let selectedRow = dayPicker.selectedRow(inComponent: 0)
        let selectedDay = daysOfWeek[selectedRow]
        let startTime = startTextField.text ?? ""
        let endTime = endTextField.text ?? ""
        
        // 데이터 전달 클로저를 호출하여 데이터를 이전 뷰 컨트롤러로 전달
        dataCompletion?(selectedDay, startTime, endTime)
        
        dismiss(animated: false, completion: nil)
    }
    
    func formatTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    /*@objc func starttimePickerValueChanged(sender: UIDatePicker) {
        let selectedTime = sender.date
        startTextField.text = formatTime(selectedTime)
    }
    
    @objc func endtimePickerValueChanged(sender: UIDatePicker) {
        let selectedTime = sender.date
        endTextField.text = formatTime(selectedTime)
    }*/
    
    func createToolbarForPicker(selector: Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: selector)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        return toolbar
    }

    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    /*@objc func plusButtonTapped(sender: UIButton) {
        // Increase containerView height
        containerView.frame.size.height += 150
    }*/
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    

}

extension PopupVC: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return daysOfWeek.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return daysOfWeek[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dayTextField.text = daysOfWeek[row]
    }
}
