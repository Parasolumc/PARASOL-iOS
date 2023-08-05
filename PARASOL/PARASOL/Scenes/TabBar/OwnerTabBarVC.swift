//
//  OwnerTabBarVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/01.
//

import UIKit

class OwnerTabBarVC: UITabBarController {
    
    let HEIGHT_TAB_BAR: CGFloat = 100
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBarUI()
        
    }
    
    func configureBarUI() {
        view.backgroundColor = UIColor(named: "white")
        
        // 탭바 속성 지정
        tabBar.barTintColor = UIColor(named: "white")
        // 탭바 아이템 색상 지정
        tabBar.tintColor = UIColor(named: "main")
        tabBar.unselectedItemTintColor = UIColor(named: "black")
        
        tabBar.isHidden = false
        tabBar.isTranslucent = false
        
        // 탭바 아이템 뷰컨트롤러 연동
        let Menu = UINavigationController(rootViewController: OwnerMenuVC())
        Menu.tabBarItem.selectedImage = UIImage(named: "menu") // 선택됐을 때 이미지
        Menu.tabBarItem.image = UIImage(named: "menu") // 선택 안됐을 때 이미지
        
        let Home = UINavigationController(rootViewController: OwnerVC())
        Home.tabBarItem.selectedImage = UIImage(named: "select_home") // 선택됐을 때 이미지
        Home.tabBarItem.image = UIImage(named: "home") // 선택 안됐을 때 이미지
        
        let Mypage = UINavigationController(rootViewController: MypageVC())
        Mypage.tabBarItem.selectedImage = UIImage(named: "select_mypage") // 선택됐을 때 이미지
        Mypage.tabBarItem.image = UIImage(named: "mypage") // 선택 안됐을 때 이미지
        
        viewControllers = [Menu, Home, Mypage]
        
        self.selectedIndex = 1 // 현재 선택된 탭 바 아이템을 두 번째 탭 바 아이템으로 변경
        
        self.setViewControllers(viewControllers, animated: true)
        
        self.hidesBottomBarWhenPushed = false // 네비게이션 컨트롤러에 푸시 됐을 때 제거되지 않게 해주는 옵션
    }
    
    // 탭바 아이템 가운데에 위치하게 끔 조정
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = HEIGHT_TAB_BAR
        tabFrame.origin.y = self.view.frame.size.height - HEIGHT_TAB_BAR
        self.tabBar.frame = tabFrame
    }
    
    

}
