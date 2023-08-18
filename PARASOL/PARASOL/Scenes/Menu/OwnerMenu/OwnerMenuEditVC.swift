//
//  OwnerMenuEditVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/06.
//

import UIKit

class OwnerMenuEditVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    /*var updatedWorkingday: String?
    var updatedStartTime: String?
    var updatedEndTime: String?*/
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    // 소개 라벨 최대 사이즈
    lazy var labelMaxWidth = screenWidth - 50
    
    // 대여중인 우산의 개수
    var rentNum = 3
    // 대여가능한 우산의 개수
    var umbrellaNum = 9
    
    // 영업중인 요일
    var workingday = ""
    
    // 영업 시작, 종료 시간
    var starttime = ""
    var endtime = ""
    
    // MARK: [UI components]
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var isOpenLabel: UILabel = {
        let label = UILabel()
        
        label.text = "영업종료"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var workingdayLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.workingday)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var startLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.starttime)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var spacerLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var endLabel: UILabel = {
        let label = UILabel()
        label.text = String(self.endtime)
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    lazy var timeStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.workingdayLabel, self.startLabel, self.spacerLabel, self.endLabel])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 4
        
        return stackview
    }()
    
    lazy var storeTimeHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.isOpenLabel, self.timeStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10

        return stackView
    }()

    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.addressLabel, self.storeTimeHStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        stackView.setDimensions(height: 100, width: (screenWidth - 50))
        return stackView
    }()
    
    lazy var imagePickerController: UIImagePickerController = {
        let imagepickercontroller = UIImagePickerController()
        imagepickercontroller.sourceType = .photoLibrary
       
        return imagepickercontroller
    }()
    
    let picsScrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isPagingEnabled = true
        
        return scrollview
    }()
    
    let picsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 8
        
        return stackview
    }()
    
    let plusImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    
    let addPicsView: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 70)
        view.backgroundColor = UIColor(named: "gray00_opacity")
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var introduceLabel: UILabel = {
        let label = UILabel()
        label.text = "매장 설명"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.preferredMaxLayoutWidth = self.labelMaxWidth
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var introduceTextView: UITextView = {
        let textview = UITextView()
        textview.setDimensions(height: 253, width: 342)
        textview.layer.cornerRadius = 20
        textview.backgroundColor = UIColor(named: "gray00_opacity")
        textview.textContainerInset = .init(top: 30, left: 20, bottom: 30, right: 20)
        textview.font = UIFont.systemFont(ofSize: 14)
        
        return textview
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 166)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 166)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.backgroundColor = UIColor(named: "main")
        
        return button
    }()
    
 
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPlusButton))
        addPicsView.addGestureRecognizer(tapGesture)
        addPicsView.isUserInteractionEnabled = true
        
        let timetapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTimeLabel))
        timeStackView.addGestureRecognizer(timetapGesture)
        timeStackView.isUserInteractionEnabled = true
        
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
    }
    
    /*override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let workingday = updatedWorkingday, let startTime = updatedStartTime, let endTime = updatedEndTime {
            updateUI(with: workingday, startTime: startTime, endTime: endTime)
            
            // 업데이트 후 초기화 (필요한 경우)
            updatedWorkingday = nil
            updatedStartTime = nil
            updatedEndTime = nil
        }
    }*/
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "정보 수정"
    }
    
    // UI 레이아웃 세팅
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        view.addSubview(introduceLabel)
        view.addSubview(introduceTextView)
        view.addSubview(picsScrollView)
        view.addSubview(cancelButton)
        view.addSubview(confirmButton)
        
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        vStackView.centerX(inView: view)
        
        picsScrollView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 17, paddingLeft: 25, paddingRight: 25)
        picsScrollView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        //picsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        picsScrollView.addSubview(picsStackView)
        
        picsStackView.anchor(top: picsScrollView.topAnchor, left: picsScrollView.leftAnchor, bottom: picsScrollView.bottomAnchor, right: picsScrollView.rightAnchor)
        
        picsStackView.addArrangedSubview(addPicsView)
        picsStackView.addSubview(plusImageView)
        
        addPicsView.addSubview(plusImageView)
        plusImageView.centerX(inView: addPicsView)
        plusImageView.centerY(inView: addPicsView)
        
        introduceLabel.anchor(top: picsScrollView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        introduceTextView.anchor(top: introduceLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 18, paddingLeft: 24)
        
        cancelButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,  paddingLeft: 24, paddingBottom: 20)
        
        confirmButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 24)
        
        imagePickerController.delegate = self
        
    }
    
    @objc func didTapPlusButton() {
        present(imagePickerController, animated: true)
    }
    
    @objc func didTapDeleteButton(sender: UIButton) {
        if let picView = sender.superview as? UIImageView {
            picView.removeFromSuperview()
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let selectedImage = info[.originalImage] as? UIImage {
            let picView = UIImageView(image: selectedImage)
            picView.contentMode = .scaleAspectFill
            picView.clipsToBounds = true
            picView.layer.cornerRadius = 20
            picView.setDimensions(height: 107, width: 129)
            
            
            picsStackView.addArrangedSubview(picView)
        }

    }
    
    @objc func didTapTimeLabel() {
        let popupVC = PopupVC()
        
        popupVC.modalPresentationStyle = .overCurrentContext
        present(popupVC, animated: true, completion: nil)
    }
    
    // 값을 재설정
    func updateUI(with workingday: String, startTime: String, endTime: String) {
        workingdayLabel.text = workingday
        startLabel.text = startTime
        endLabel.text = endTime
        
        configureUI()
    }
    
    @objc func confirmButtonTapped() {
        editData()
    }
    
    @objc func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "정보 변경 성공", message: "정보가 성공적으로 변경되었습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            let vc = OwnerTabBarVC()
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
        }
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    
    func editData() {
        /*let newInfo = introduceTextView.text
        let startTime = startLabel.text
        let endTime = endLabel.text*/
        
        let changeData: EditInfoModel = EditInfoModel(desc: "hello", openTime: "10:10", closeTime: "21:30")
        MenuManager.shared.editShopInfo(editShopInfoData: changeData) { result in
            switch result {
            case .success(let data):
                if data["check"] as? Bool == true {
                    print("정보 변경 성공")
                    self.showSuccessAlert()
                } else {
                    print("정보 변경 실패")
                }
            case .failure(let error):
                print(error)
                return
            }
        
        }
    }
    
    func uploadImage(image: UIImage) {
        let imageData = UIImage(named: "temp")
        MenuManager.shared.upLoadPhoto(image: image) { result in
            switch result {
            case .success(let response):
                // 업로드 성공 시 처리
                if response["check"] as? Bool == true {
                    print("업로드 성공")
                    self.showSuccessAlert()
                } else {
                    print("업로드 실패")
                }
            case .failure(let error):
                // 업로드 실패 시 처리
                print(error)
                return
            }
        }
    }
    
}
