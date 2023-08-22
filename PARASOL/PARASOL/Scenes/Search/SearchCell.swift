//
//  SearchCell.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/25.
//

import UIKit

class SearchCell: UITableViewCell {
    // MARK: - Properties
    // 변수 및 상수, IBOutlet

    // MARK: [UI components]
    var mapPointImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "map_point")
        imageView.setDimensions(height: 24, width: 24)
        
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "상점명"
        label.font = .M16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    var distanceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "3000km"
        label.font = .M14
        label.textColor = UIColor(named: "gray22")
        return label
    }()
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.nameLabel, self.distanceLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.setDimensions(height: 20, width: self.frame.width - 24)

        return stackView
    }()
    
    var addressLabel: UILabel = {
        let label = UILabel()
        
        label.text = "신촌로 20길 81"
        label.font = .R14
        label.textColor = UIColor(named: "gray22")
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.hStackView, self.addressLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.setDimensions(height: 50, width: self.frame.width - 24)

        return stackView
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
        addSubview(mapPointImage)
        addSubview(vStackView)
        
        mapPointImage.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 24, paddingLeft: 34)
        vStackView.anchor(left: mapPointImage.rightAnchor, paddingLeft: 20)
        vStackView.centerY(inView: self)

        
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}
