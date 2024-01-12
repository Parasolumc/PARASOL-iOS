//
//  AlarmCell.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/09/01.
//

import UIKit

class AlarmCell: UITableViewCell {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    // MARK: [for sizing]
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    // MARK: [for delte Alarm]
    var deleteAlarmId: Int = 0
    weak var alarmCellDelegate: AlarmCellDelegate?
    
    // MARK: [UI components]
    lazy var wholeView: UIView = {
        let view = UIView()
        
        view.setWidth(width: screenWidth - 48)
        view.setHeight(height: 105)
        view.backgroundColor = UIColor(named: "light")
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "가게명"
        label.font = .B16
        label.textColor = UIColor(named: "black")
        
        return label
    }()

    var contentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "알림 내용"
        label.font = .M16
        label.textColor = UIColor(named: "black")
        label.numberOfLines = 0
        
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "2023년 00월 00일"
        label.font = .M14
        label.textColor = UIColor(named: "gray22")
        
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.contentLabel, self.timeLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 7
        
        return stackView
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "clear_delete"), for: .normal)
        button.setDimensions(height: 22, width: 22)
        button.backgroundColor = UIColor(named: "light")
        
        button.isUserInteractionEnabled = true
                                                          
        return button
    }()
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        backgroundColor = UIColor(named: "white")
        
        addSubview(wholeView)
        wholeView.addSubview(deleteButton)
        wholeView.addSubview(vStackView)
        
        wholeView.centerX(inView: self)
        wholeView.anchor(top: self.topAnchor, bottom: self.bottomAnchor, paddingTop: 5, paddingBottom: 5)
        deleteButton.anchor(top: wholeView.topAnchor, right: wholeView.rightAnchor, paddingTop: 12, paddingRight: 16)
        vStackView.centerY(inView: wholeView)
        vStackView.anchor(left: wholeView.leftAnchor, right: deleteButton.leftAnchor, paddingLeft: 27)
            
        deleteButton.addTarget(self, action: #selector(deleteaaa), for: .touchUpInside)
        
    }
        
    @objc func deleteaaa() {
        alarmCellDelegate?.didTapDeleteButton()
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

    override func prepareForReuse() {
        super.prepareForReuse()
        alarmCellDelegate = nil
    }
}

// 알람 삭제 프로토콜
protocol AlarmCellDelegate: AnyObject {
    func didTapDeleteButton()
}
