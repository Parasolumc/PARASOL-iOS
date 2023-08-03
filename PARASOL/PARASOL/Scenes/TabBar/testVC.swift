//
//  testVC.swift
//  PARASOL
//
//  Created by 장윤정 on 2023/08/01.
//

import UIKit

class testVC: UIViewController {

    @IBOutlet weak var UserButton: UIButton!
    @IBOutlet weak var OwnerButton: UIButton!
    
    @IBAction func goToUserHome(_ sender: Any) {
        let vc = UserTabBarVC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    @IBAction func goToOwnerHome(_ sender: Any) {
        let vc = OwnerTabBarVC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(vc, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
