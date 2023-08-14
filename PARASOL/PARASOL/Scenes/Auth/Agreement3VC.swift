//
//  Agreement3VC.swift
//  PARASOL
//
//  Created by 서주영 on 2023/08/14.
//

import UIKit

class Agreement3VC : UIViewController {
    
    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // 화면 사이즈
    var bounds = UIScreen.main.bounds
    lazy var screenWidth = bounds.size.width //화면 너비
    lazy var screenHeight = bounds.size.height //화면 높이
    
    let Agreement3ScrollView : UIScrollView = {
        let scrollview = UIScrollView()
        
        return scrollview
    }()
    
    let Agreement3TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "위치기반서비스 이용약관"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 16)
        
        return label
    }()
    
    let FirstTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제1조(목적)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FirstExpLabel : UILabel = {
        let label = UILabel()
        label.text = "본 약관은 회원(파라솔의 서비스 약관에 동의한 자를 말하며 이하 '회원'이라고 합니다)이 파라솔(이하 '회사'라고 합니다)가 제공하는 웹페이지 및 '파라솔(PARASOL)' (회사가 개발 운영하는 모바일 애플리케이션을 말합니다 이하 '모바일앱'이라고 합니다)의 서비스를 이용함에 있어 회원과 회사의 권리 및 의무, 기타 제반 사항을 정하는 것을 목적으로 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FirstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstTitleLabel, self.FirstExpLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SecondTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제2조(가입자격)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SecondExpLabel : UILabel = {
        let label = UILabel()
        label.text = "서비스에 가입할 수 있는 회원은 위치기반서비스를 이용할 수 있는 이동전화 단말기의 소유자 본인이어야 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SecondStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SecondTitleLabel, self.SecondExpLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let ThirdTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제3조(서비스 가입)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회사는 다음 각 호에 해당하는 가입신청을 승낙하지 않을 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdExam1Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 실명이 아니거나 타인의 명의를 사용하는 등 허위로 신청하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdExam2Label : UILabel = {
        let label = UILabel()
        label.text = "     2. 고객 등록 사항을 누락하거나 오기하여 신청하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdExam3Label : UILabel = {
        let label = UILabel()
        label.text = "     3. 공공질서 또는 미풍양속을 저해하거나 저해할 목적을 가지고 신청하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThirdExam4Label : UILabel = {
        let label = UILabel()
        label.text = "     4. 기타 회사가 정한 이용신청 요건이 충족되지 않았을 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var ThirdStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ThirdTitleLabel, self.ThirdExpLabel, self.ThirdExam1Label, self.ThirdExam2Label, self.ThirdExam3Label, self.ThirdExam4Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FourTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제4조(서비스 해지)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FourExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회원은 회사가 정한 절차를 통해 서비스 해지를 신청할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FourStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FourTitleLabel, self.FourExpLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FiveTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제5조(이용약관의 효력 및 변경)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 회사가 정한 소정의 절차에 따라 회원으로 등록함으로써 효력이 발생합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 서비스를 신청한 고객 또는 개인위치정보주체가 온라인에서 본 약관을 모두 읽고 \"동의하기\" 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 본 약관에 대하여 동의하지 않은 경우, 회사가 개인위치정보를 기반으로 제공하는 각종 혜택 및 편의제공에 일부 제한이 발생할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 회사는 필요한 경우 '위치 정보의 보호 및 이용 등에 관한 법률, '콘텐츠산업 진흥법', '전자상거래 등에서의 소비자보호에 관한 법률', '소비자기본법', '약관의 규제에 관한 법률 등 관계법령(이하 '관계법령'이라 합니다)의 범위 내에서 본 약관을 개정할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FiveCon5Label : UILabel = {
        let label = UILabel()
        label.text = " 5. 회사가 약관을 개정할 경우 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 회사의 웹페이지 및 모바일앱을 통해 공지합니다. 다만, 개정약관의 내용이 회원에게 새로운 의무를 부과하거나 권리를 제한하는 내용인 경우 그 적용일자 30일 전부터 상당한 기간 동안 이를 회사의 웹페이지 및 모바일앱을 통해 공지하고, 회원에게 전자적형태로 약관의 개정사실을 발송하여 고지합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FiveStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FiveTitleLabel, self.FiveCon1Label, self.FiveCon2Label, self.FiveCon3Label, self.FiveCon4Label, self.FiveCon5Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SixTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제6조(약관 외 준칙)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SixExpLabel : UILabel = {
        let label = UILabel()
        label.text = "본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 및 건전한 거래관행에 따릅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SixStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SixTitleLabel, self.SixExpLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SevenTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제7조(서비스의 내용)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SevenExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회사가 제공하는 서비스는 아래와 같습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SevenExam1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사 및 제휴사의 상품 및 서비스 정보 제공"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SevenExam2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사 및 제휴사의 마케팅 서비스 제공"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SevenExam3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 회사 및 제휴사의 프로모션 혜택 알림 제공"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SevenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SevenTitleLabel, self.SevenExpLabel, self.SevenExam1Label, self.SevenExam2Label, self.SevenExam3Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let EightTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제8조(서비스 이용요금)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EightCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사의 서비스는 무료제공을 원칙으로 합니다. 다만, 회원이 별도로 유료서비스를 이용하고자 할 경우 해당 서비스 화면에 명시된 요금을 지불하여야 사용할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EightCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사는 유료서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EightCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 유료서비스 이용을 위하여 결제된 대금에 대한 취소 및 환불은 관계법령과 회사의 운영정책에 따릅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EightCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 무선 서비스 이용시 발생하는 데이터 통신료는 별도이며, 이 때 부과되는 데이터 통신료는 회원이 가입한 각 이동통신사의 정책에 따릅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EightCon5Label : UILabel = {
        let label = UILabel()
        label.text = " 5. 멀티미디어 메시지 서비스(MMS) 등으로 게시물을 등록할 경우 발생하는 요금은 각 이동통신사의 요금정책에 따라 회원이 부담합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var EightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.EightTitleLabel, self.EightCon1Label, self.EightCon2Label, self.EightCon3Label, self.EightCon4Label, self.EightCon5Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let NineTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제9조(서비스내용 변경 통지 등)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NineCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 회원이 등록한 전자우편 주소로 이메일을 발송하여 서비스 내용의 변경 사항 또는 종료를 사전 일주일 전에 통지합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NineCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 전항의 경우 불특정 다수의 회원을 상대로 통지하는 때에는 회사의 웹페이지 등을 통해 공지함으로써 회원들에게 통지할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var NineStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.NineTitleLabel, self.NineCon1Label, self.NineCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let TenTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제10조(서비스이용의 제한 및 중지)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사는 아래 각 호에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon11Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 회원이 회사의 서비스 운영을 고의 또는 과실로 방해하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon12Label : UILabel = {
        let label = UILabel()
        label.text = "     2. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon13Label : UILabel = {
        let label = UILabel()
        label.text = "     3. 전기통신사업법에 규정된 기간통신사업자가 서비스를 중지했을 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon14Label : UILabel = {
        let label = UILabel()
        label.text = "     4. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon15Label : UILabel = {
        let label = UILabel()
        label.text = "     5. 기타 중대한 사유로 회사가 서비스 제공을 지속하는 것이 곤란한 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TenCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 회사가 전항에 따라 서비스의 이용을 제한하거나 중지한 때에는 해당사실을 인터넷 등에 공지하거나 고객에게 통지합니다. 다만 회사가 통제할 수 없는 사유로 인하여 서비스를 중단하게 되는 경우 이를 사후에 통지할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var TenStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.TenTitleLabel, self.TenCon1Label, self.TenCon11Label, self.TenCon12Label, self.TenCon13Label, self.TenCon14Label, self.TenCon15Label, self.TenCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let ElvnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제11조(개인위치정보의 이용 또는 제공)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사가 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 본 약관에 대한 개인위치정보주체의 동의를 얻어야 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사는 회원이 제공한 개인위치정보를 해당 회원의 동의 없이 서비스 제공 이외의 목적으로 이용하지 않습니다. 다만, 고객이 미리 요청한 경우 해당 내용을 고객이 지정한 통신단말장치(휴대전화 등)나 이메일 주소로 통보할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리 등을 위해 회원의 위치정보 이용 · 제공사실 확인자료를 자동 기록 · 보존하며, 해당 자료는 1년간 보관합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 회사가 개인위치정보를 회원이 지정하는 제3자에게 제공하는 경우, 위치정보를 수집한 당해 통신 단말장치로 매회 회원에게 제공받는 자, 제공일시, 제공목적을 즉시 통보합니다. 다만 다음 각호의 경우에는 회원이 미리 지정한 통신단말장치 또는 전자우편주소로 통보합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon41Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 개인위치정보를 수집한 통신단말장치가 문자, 음성 또는 영상 수신기능을 갖추지 아니한 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ElvnCon42Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회원이 다른 방법을 요청한 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var ElvnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ElvnTitleLabel, self.ElvnCon1Label, self.ElvnCon2Label, self.ElvnCon3Label, self.ElvnCon4Label, self.ElvnCon41Label, self.ElvnCon42Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let TwlvTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제12조(개인위치정보의 보유기간 및 이용기간)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TwlvCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사가 회원의 개인위치정보를 이용하였다면 회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항의 규정에 따라 기록 · 보존해야 하는 위치정보이용 제공사실 확인자료 이외의 해당 개인위치정보를 같은 법 제23조에 따라 고객이 동의한 목적범위 내에서 이용하고 고객 응대를 위하여 1년간 보유하며, 이 기간이 지나면 즉시 파기합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let TwlvCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 전항에도 불구하고 관계법령 등에서 개인위치정보를 보존할 의무 및 필요성이 있는 경우에는 그에 따라 보존합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var TwlvStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.TwlvTitleLabel, self.TwlvCon1Label, self.TwlvCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let ThrnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제13조(개인위치정보 주체의 권리)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 회원은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon31Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 본인에 대한 위치정보 이용, 제공사실 확인자료"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon32Label : UILabel = {
        let label = UILabel()
        label.text = "     2. 본인의 위치정보가 제3자에게 제공된 이유 및 내용"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let ThrnCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 회원은 회사가 정한 절차에 따라 제1항 내지 제3항의 권리를 행사할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var ThrnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.ThrnTitleLabel, self.ThrnCon1Label, self.ThrnCon2Label, self.ThrnCon3Label, self.ThrnCon31Label, self.ThrnCon32Label, self.ThrnCon4Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FrtnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제14조(법정대리인의 권리)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FrtnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사는 14세 미만회원에 대해서는 당해 회원과 회원의 법정대리인으로부터 모두 동의를 받은 경우에만 개인위치정보를 이용한 서비스를 제공합니다. 이 경우 법정대리인은 본 약관에 의한 회원의 권리를 모두 가지며 회사는 법정대리인을 회원으로 봅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FrtnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사는 14세 미만회원의 개인위치정보 및 위치정보 이용, 제공사실에 관한 확인자료를 본 약관에 명시 또는 고지한 범위를 넘어 이용하거나, 제3자에게 제공하고자 하는 경우 당해 회원과 회원의 법정대리인에게 모두 동의를 받아야합니다. 다만 다음 각호의 경우는 제외합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FrtnCon21Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 개인위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    
    let FrtnCon22Label : UILabel = {
        let label = UILabel()
        label.text = "     2. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FrtnCon23Label : UILabel = {
        let label = UILabel()
        label.text = "     3. 기타 관계법령에 특별한 규정이 있는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FrtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FrtnTitleLabel, self.FrtnCon1Label, self.FrtnCon2Label, self.FrtnCon21Label, self.FrtnCon22Label, self.FrtnCon23Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let FftnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제15조(위치정보관리책임자의 지정)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FftnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보의 관리책임자로 지정하고 운영합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let FftnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사의 위치정보관리책임자는 위치기반서비스의 제공에 관한 제반 사항을 담당 · 관리하는 부서의 대표으로서, 구체적인 사항은 본 약관의 부칙에 따릅니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var FftnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FftnTitleLabel, self.FftnCon1Label, self.FftnCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SxtnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제16조(손해배상)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SxtnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위를 하여 회원에게 손해가 발생한 경우 회원은 회사에 대하여 손해배상 청구를 할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SxtnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회원이 고의 또는 과실로 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회원은 회사에 발생한 모든 손해를 배상해야 합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SxtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SxtnTitleLabel, self.EightCon1Label, self.EightCon2Label, self.EightCon3Label, self.EightCon4Label, self.EightCon5Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let SvtnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제17조(면책)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사는 다음 각 호의 사유로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon11Label : UILabel = {
        let label = UILabel()
        label.text = "     1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon12Label : UILabel = {
        let label = UILabel()
        label.text = "     2. 제3자의 고의적인 서비스 방해가 있는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon13Label : UILabel = {
        let label = UILabel()
        label.text = "     3. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon14Label : UILabel = {
        let label = UILabel()
        label.text = "     4. 기타 회사의 고의 또는 과실이 없는 사유에 해당하는 경우"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도 및 정확성 등에 대한 보증을 하지 않으며 이로 인하여 회원에게 발생한 손해에 대하여 책임을 부담하지 않습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let SvtnCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 회사는 회원이 서비스를 이용하며 기대하는 수익을 상실한 것에 대한 책임과, 그 밖의 서비스를 통하여 얻은 자료로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var SvtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.SvtnTitleLabel, self.SvtnCon1Label, self.SvtnCon11Label, self.SvtnCon12Label, self.SvtnCon13Label, self.SvtnCon14Label, self.SvtnCon2Label, self.SvtnCon3Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let EgtnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제18조(분쟁의 조정)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EgtnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 '위치정보의 보호 및 이용 등에 관한 법률' 제28조의 규정에 따라 방송통신위원회에 재정을 신청할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let EgtnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 '개인정보보호법' 제43조의 규정에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var EgtnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.EgtnTitleLabel, self.EgtnCon1Label, self.EgtnCon2Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let NntnTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제19조(회사의 연락처)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NntnExpLabel : UILabel = {
        let label = UILabel()
        label.text = "회사의 상호 및 주소 등은 다음과 같습니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NntnCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 법인명 : 파라솔"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NntnCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 대표이사 : 이다현"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NntnCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 소재지 : 서울 노원구 노원로22길 71 (중계동, 건영3차아파트)312-101"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let NntnCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 연락처 : 010-6610-2955"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var NntnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.NntnTitleLabel, self.NntnExpLabel, self.NntnCon1Label, self.NntnCon2Label, self.NntnCon3Label, self.NntnCon4Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let BonusTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "부 칙"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let BonusFirstTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제1조(시행일)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        
        return label
    }()
    
    let BonusFirstExpLabel : UILabel = {
        let label = UILabel()
        label.text = "본 약관은 2023.09.01부터 시행합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var BonusFirstStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.BonusFirstTitleLabel, self.BonusFirstExpLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    let BonusSecondTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "제2조(위치정보관리책임자)"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Bold", size: 8)
        
        return label
    }()
    
    let BonusSecondExpLabel : UILabel = {
        let label = UILabel()
        label.text = "위치정보관리책임자는 2023.09.01를 기준으로 다음과 같이 지정합니다."
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let BonusSecondCon1Label : UILabel = {
        let label = UILabel()
        label.text = " 1. 소속 : 파라솔"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let BonusSecondCon2Label : UILabel = {
        let label = UILabel()
        label.text = " 2. 성명 : 이다현"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let BonusSecondCon3Label : UILabel = {
        let label = UILabel()
        label.text = " 3. 직위 : 대표"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    let BonusSecondCon4Label : UILabel = {
        let label = UILabel()
        label.text = " 4. 전화 : 010-6610-2955"
        label.textColor = UIColor(named: "black")
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Regular", size: 8)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var BonusSecondStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.BonusSecondTitleLabel, self.BonusSecondExpLabel, self.BonusSecondCon1Label, self.BonusSecondCon2Label, self.BonusSecondCon3Label, self.BonusSecondCon4Label])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 4
        
        return stackView
    }()
    
    lazy var ContentsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.FirstStackView, self.SecondStackView, self.ThirdStackView, self.FourStackView, self.FiveStackView, self.SixStackView, self.SevenStackView, self.EightStackView, self.NineStackView, self.TenStackView, self.ElvnStackView, self.TwlvStackView, self.ThrnStackView, self.FrtnStackView, self.FftnStackView, self.SxtnStackView, self.EgtnStackView, self.NntnStackView,  self.BonusTitleLabel, self.BonusFirstStackView, self.BonusSecondStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 20
        
        return stackView
    }()
    
    lazy var FullStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.Agreement3TitleLabel, self.ContentsStackView])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        // 레이아웃 설정
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        // 요소간 간격 조정
        stackView.spacing = 26
        
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    
    func setNavigationBar() {
        self.navigationItem.title = "약관동의"
    }
    
    func configureUI() {
        view.addSubview(Agreement3ScrollView)
        view.addSubview(FullStackView)
        
        view.backgroundColor = UIColor(named: "white")
        self.Agreement3ScrollView.backgroundColor = UIColor(named: "white")
        self.FullStackView.backgroundColor = UIColor(named: "white")
        
        FirstTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FirstExpLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SecondExpLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdExpLabel.translatesAutoresizingMaskIntoConstraints = false
        ThirdExam1Label.translatesAutoresizingMaskIntoConstraints = false
        ThirdExam2Label.translatesAutoresizingMaskIntoConstraints = false
        ThirdExam3Label.translatesAutoresizingMaskIntoConstraints = false
        ThirdExam4Label.translatesAutoresizingMaskIntoConstraints = false
        FourTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FourExpLabel.translatesAutoresizingMaskIntoConstraints = false
        FiveTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FiveCon1Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon2Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon3Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon4Label.translatesAutoresizingMaskIntoConstraints = false
        FiveCon5Label.translatesAutoresizingMaskIntoConstraints = false
        SixTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SixExpLabel.translatesAutoresizingMaskIntoConstraints = false
        SevenTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SevenExpLabel.translatesAutoresizingMaskIntoConstraints = false
        SevenExam1Label.translatesAutoresizingMaskIntoConstraints = false
        SevenExam2Label.translatesAutoresizingMaskIntoConstraints = false
        SevenExam3Label.translatesAutoresizingMaskIntoConstraints = false
        EightTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        EightCon1Label.translatesAutoresizingMaskIntoConstraints = false
        EightCon2Label.translatesAutoresizingMaskIntoConstraints = false
        EightCon3Label.translatesAutoresizingMaskIntoConstraints = false
        EightCon4Label.translatesAutoresizingMaskIntoConstraints = false
        EightCon5Label.translatesAutoresizingMaskIntoConstraints = false
        NineTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NineCon1Label.translatesAutoresizingMaskIntoConstraints = false
        NineCon2Label.translatesAutoresizingMaskIntoConstraints = false
        TenTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        TenCon1Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon11Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon12Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon13Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon14Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon15Label.translatesAutoresizingMaskIntoConstraints = false
        TenCon2Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon3Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon4Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon41Label.translatesAutoresizingMaskIntoConstraints = false
        ElvnCon42Label.translatesAutoresizingMaskIntoConstraints = false
        TwlvTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        TwlvCon1Label.translatesAutoresizingMaskIntoConstraints = false
        TwlvCon2Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon3Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon31Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon32Label.translatesAutoresizingMaskIntoConstraints = false
        ThrnCon4Label.translatesAutoresizingMaskIntoConstraints = false
        FrtnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FrtnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        FrtnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        FrtnCon21Label.translatesAutoresizingMaskIntoConstraints = false
        FrtnCon22Label.translatesAutoresizingMaskIntoConstraints = false
        FrtnCon23Label.translatesAutoresizingMaskIntoConstraints = false
        FftnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        FftnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        FftnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        SxtnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SxtnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        SxtnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon11Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon12Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon13Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon14Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        SvtnCon3Label.translatesAutoresizingMaskIntoConstraints = false
        EgtnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        EgtnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        EgtnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        NntnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NntnCon1Label.translatesAutoresizingMaskIntoConstraints = false
        NntnCon2Label.translatesAutoresizingMaskIntoConstraints = false
        NntnCon3Label.translatesAutoresizingMaskIntoConstraints = false
        NntnCon4Label.translatesAutoresizingMaskIntoConstraints = false
        BonusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        BonusFirstTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        BonusFirstExpLabel.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondExpLabel.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondCon1Label.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondCon2Label.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondCon3Label.translatesAutoresizingMaskIntoConstraints = false
        BonusSecondCon4Label.translatesAutoresizingMaskIntoConstraints = false
        
        // 스크롤 뷰 레이아웃 설정
        self.Agreement3ScrollView.addSubview(FullStackView)
        
        self.Agreement3ScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.Agreement3ScrollView.widthAnchor.constraint(equalToConstant: (screenWidth - 90)).isActive = true
        self.Agreement3ScrollView.heightAnchor.constraint(equalToConstant: (screenHeight - 136)).isActive = true
        self.Agreement3ScrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.Agreement3ScrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.Agreement3ScrollView.contentSize = self.FullStackView.bounds.size
        
        FullStackView.anchor(top: self.Agreement3ScrollView.topAnchor, paddingTop: 0)
        
        // 스택 뷰 레이아웃 설정
        self.FullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.FullStackView.topAnchor.constraint(equalTo: self.Agreement3ScrollView.contentLayoutGuide.topAnchor).isActive = true
        self.FullStackView.leadingAnchor.constraint(equalTo: self.Agreement3ScrollView.contentLayoutGuide.leadingAnchor).isActive = true
        self.FullStackView.bottomAnchor.constraint(equalTo: self.Agreement3ScrollView.contentLayoutGuide.bottomAnchor).isActive = true
        self.FullStackView.trailingAnchor.constraint(equalTo: self.Agreement3ScrollView.contentLayoutGuide.trailingAnchor).isActive = true
        
        self.FullStackView.widthAnchor.constraint(equalTo: self.Agreement3ScrollView.widthAnchor, multiplier: 1.0).isActive = true
    }
}
