//
//  AlarmVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/07/18.
//

import UIKit

private let cellID = "AlarmCell"

class AlarmVC: UIViewController {

    // MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    // MARK: [For Data]
    var alarmList: [AlarmInformation] = [AlarmInformation(id: 3, content: "알람 내역을 불러오는 데 실패하였습니다.", sentTime: "9999-99-99T00:00:00", recipientId: 3, shopId: 3, type: "", shopName: "알람 조회 실패")]
    
    // MARK: [For UI Components]
    let noneLabel: UILabel = {
       let label = UILabel()
        
        label.text = "알림이 없습니다."
        label.font = .M16
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    let alarmTableView = UITableView()

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setTableViewData()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    func configureUI() {
        setNavigationBar()
        setTableView()
        setNone()
    }
    
    func setNone() {
        view.addSubview(noneLabel)
        
        noneLabel.centerX(inView: view)
        noneLabel.centerY(inView: view)
    }
    
    func setExist() {
        noneLabel.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "알림"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Pretendard-Bold", size: 18)!]
    }
    
    func setTableView() {
        alarmTableView.delegate = self
        alarmTableView.dataSource = self
        alarmTableView.register(AlarmCell.self, forCellReuseIdentifier: cellID)
        
        // 테이블뷰 구분선
        alarmTableView.separatorStyle = .none
        
        view.addSubview(alarmTableView)
        alarmTableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    // TODO: 날짜 형식 변경 함수
    func changeDateFormat(_ dateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        if let date = inputFormatter.date(from: dateString) {
            return outputFormatter.string(from: date)
        } else {
            return "" // 잘못된 형식의 날짜 문자열인 경우 ""을 반환
        }
    }
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의
    func setData(completion: @escaping (String) -> Void) {
        AlarmManager.shared.getAlarmList() { [self] result in
            switch result {
            case .success(let data):
                print("알람 조회 성공")
                alarmList = data.information
                completion("성공") // 알람 조회 성공 시 "성공" 문자열을 클로저를 통해 반환
            case .failure(let error):
                print("알람 조회 에러\n\(error)")
                completion("실패") // 알람 조회 실패 시 "실패" 문자열을 클로저를 통해 반환
            }
        }
    }
    
    func setTableViewData() {
        setData { [self] result in
            switch result {
            case "성공":
                print("테이블 데이터 세팅")
                alarmTableView.reloadData()
                if alarmList.isEmpty {
                    noneLabel.text = "알림이 없습니다."
                } else {
                    noneLabel.text = ""
                }
            case "실패":
                print("테이블 데이터 세팅 실패")
            default:
                print("테이블 데이터 세팅 시")
            }
        }
    }
    
}

// MARK: - Extensions
extension AlarmVC: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! AlarmCell
        
        if alarmList.isEmpty {
            self.setNone()
        } else {
            self.setExist()
            cell.nameLabel.text = alarmList[indexPath.row].shopName
            cell.contentLabel.text = alarmList[indexPath.row].content
            cell.timeLabel.text = changeDateFormat(alarmList[indexPath.row].sentTime)
            cell.deleteAlarmId = alarmList[indexPath.row].id
        }
        
//        cell.selectionStyle = .none // 셀 선택 안되게 막기
        cell.alarmCellDelegate = self
        
        return cell
    }
}

extension AlarmVC: UITableViewDelegate {
    // MARK: - Setting Size of Cells
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlarmVC: AlarmCellDelegate {
    // MARK: - setting delete Alarm method
    func didTapDeleteButton() {
        print("tab")
    }
}
