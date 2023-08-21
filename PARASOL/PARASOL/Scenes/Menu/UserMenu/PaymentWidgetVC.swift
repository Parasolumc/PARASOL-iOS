//
//  PaymentWidgetVC.swift
//  PARASOL
//
//  Created by Jini on 2023/08/20.
//

import UIKit
import TossPayments

class PaymentWidgetVC: UIViewController{
    // MARK: - Properties
    // 변수 및 상수, IBOutlet

    // MARK: [UI components]
    private lazy var widget: PaymentWidget = PaymentWidget(
        clientKey: "test_ck_vZnjEJeQVxyenLRqZEbrPmOoBN0k",
        customerKey: "PaymentWidget.ANONYMOUS"
    )
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        
        button.backgroundColor = UIColor(named: "main")
        
        button.titleLabel?.font = .SB16
        button.layer.cornerRadius = 20
        button.setDimensions(height: 49, width: 342)
        button.addTarget(self, action: #selector(requestPayment), for: .touchUpInside)
        
        return button
    }()
    
    lazy var scrollView = UIScrollView()
    lazy var stackView = UIStackView()
    
    
    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setNavigationBar()
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의
    
    func setNavigationBar() {
        self.navigationItem.title = "결제하기"
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        // scrollView에 stackView 추가
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
        let paymentMethods = widget.renderPaymentMethods(amount: PaymentMethodWidget.Amount(value: 10000))
        stackView.addArrangedSubview(paymentMethods)
        
        let agreement = widget.renderAgreement()
        stackView.addArrangedSubview(agreement)

        stackView.addArrangedSubview(payButton)
        
    }
    
    @objc func requestPayment() {
        widget.requestPayment(
            info: DefaultWidgetPaymentInfo(
                orderId: "222_3333",
                orderName: "테스트 결제"
            )
        )
        print("결제 완료")
    }
    
    
    // MARK: - Helpers
    // 설정, 데이터처리 등 액션 외의 메서드를 정의

}

// MARK: - Extensions

extension PaymentWidgetVC: TossPaymentsDelegate {
    public func handleSuccessResult(_ success: TossPaymentsResult.Success) {
        print("결제 성공")
        print("paymentKey: \(success.paymentKey)")
        print("orderId: \(success.orderId)")
        print("amount: \(success.amount)")
    }
    
    public func handleFailResult(_ fail: TossPaymentsResult.Fail) {
        print("결제 실패")
        print("errorCode: \(fail.errorCode)")
        print("errorMessage: \(fail.errorMessage)")
        print("orderId: \(fail.orderId)")

    }
}
extension PaymentWidgetVC: TossPaymentsWidgetStatusDelegate {
    public func didReceivedLoad(_ name: String) {
        print("결제위젯 렌더링 완료")
    }
}
