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
    
    // MARK: [UI components]
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "서울 서대문구 이화여대길 77"
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
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "09:00에 영업 시작"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "black")
        return label
    }()
    
    lazy var storeTimeHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.isOpenLabel, self.timeLabel])
        
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
    
    lazy var picsStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [self.addPicsView1, self.addPicsView2, self.addPicsView3, self.addPicsView4, self.addPicsView5])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 8
        
        return stackview
    }()
    
    lazy var plusImageView1: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    lazy var plusImageView2: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    lazy var plusImageView3: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    
    lazy var plusImageView4: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    lazy var plusImageView5: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "plus"))
        imageview.setDimensions(height: 30, width: 30)
        imageview.alpha = 1.0
        
        return imageview
    }()
    
    
    lazy var addPicsView1: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00")
        view.alpha = 0.4
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var addPicsView2: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00")
        view.alpha = 0.4
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var addPicsView3: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00")
        view.alpha = 0.4
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var addPicsView4: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00")
        view.alpha = 0.4
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var addPicsView5: UIView = {
        let view = UIView()
        view.setDimensions(height: 107, width: 129)
        view.backgroundColor = UIColor(named: "gray00")
        view.alpha = 0.4
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
        textview.setDimensions(height: 167, width: 342)
        textview.layer.cornerRadius = 20
        textview.backgroundColor = UIColor(named: "gray00")
        textview.alpha = 0.4
        textview.textContainerInset = .init(top: 30, left: 20, bottom: 30, right: 20)
        textview.font = UIFont.systemFont(ofSize: 14)
        
        return textview
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정완료", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setDimensions(height: 69, width: 342)
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
        
        // 각 addPicsView에 대한 탭 제스처 및 인터랙션 설정
        for addPicsView in [addPicsView1, addPicsView2, addPicsView3, addPicsView4, addPicsView5] {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAddPicsView(_:)))
            addPicsView.addGestureRecognizer(tapGesture)
            addPicsView.isUserInteractionEnabled = true
        }
        
    }
    
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
        view.addSubview(confirmButton)
        
        vStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5)
        vStackView.centerX(inView: view)
        
        picsScrollView.anchor(top: vStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 17, paddingLeft: 25, paddingRight: 25)
        picsScrollView.heightAnchor.constraint(equalToConstant: 107).isActive = true
        //picsScrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        picsScrollView.addSubview(picsStackView)
        
        picsStackView.anchor(top: picsScrollView.topAnchor, left: picsScrollView.leftAnchor, bottom: picsScrollView.bottomAnchor, right: picsScrollView.rightAnchor)
        
        picsStackView.addSubview(plusImageView1)
        picsStackView.addSubview(plusImageView2)
        picsStackView.addSubview(plusImageView3)
        picsStackView.addSubview(plusImageView4)
        picsStackView.addSubview(plusImageView5)
        
        plusImageView1.anchor(top:picsStackView.topAnchor, left: picsStackView.leftAnchor, paddingTop: 38, paddingLeft: 50)
        plusImageView2.anchor(top:picsStackView.topAnchor, left: picsStackView.leftAnchor, paddingTop: 38, paddingLeft: 188)
        plusImageView3.anchor(top:picsStackView.topAnchor, left: picsStackView.leftAnchor, paddingTop: 38, paddingLeft: 326)
        plusImageView4.anchor(top:picsStackView.topAnchor, left: picsStackView.leftAnchor, paddingTop: 38, paddingLeft: 464)
        plusImageView5.anchor(top:picsStackView.topAnchor, left: picsStackView.leftAnchor, paddingTop: 38, paddingLeft: 602)
        
        introduceLabel.anchor(top: picsScrollView.bottomAnchor, left: view.leftAnchor, paddingTop: 25, paddingLeft: 25)
        introduceTextView.anchor(top: introduceLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 18, paddingLeft: 24)
        
        confirmButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,paddingBottom: 20)
        confirmButton.centerX(inView: view)
        
        imagePickerController.delegate = self
        
    }
    
    @objc func didTapAddPicsView(_ gesture: UITapGestureRecognizer) {
        if let addPicsView = gesture.view {
            present(imagePickerController, animated: true)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let selectedImage = info[.originalImage] as? UIImage {
            // 이미지를 표시할 UIImageView 생성
            let picView = UIImageView(image: selectedImage)
            picView.contentMode = .scaleAspectFill
            picView.clipsToBounds = true
            picView.layer.cornerRadius = 20
            picView.setDimensions(height: 107, width: 129)
            
            // 선택한 addPicsView를 찾아서 제거하고, 선택한 이미지로 대체
            for (index, addPicsView) in [addPicsView1, addPicsView2, addPicsView3, addPicsView4, addPicsView5].enumerated() {
                if let subviews = picsStackView.arrangedSubviews as? [UIView], subviews.contains(addPicsView) {
                    picsStackView.removeArrangedSubview(addPicsView)
                    addPicsView.removeFromSuperview()
                    picsStackView.insertArrangedSubview(picView, at: index)
                    break
                }
            }
        }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
