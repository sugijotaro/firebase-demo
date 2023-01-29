//
//  ViewController.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LogOutButtonTapped() {
        // FirebaseAuthのログアウト処理を実行
        do {
            try Auth.auth().signOut()
            // "Tutorial"という名前のStoryboardからTutorialViewControllerをインスタンス化
            let mainVC = UIStoryboard(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: "TutorialView") as UIViewController
            // インスタンス化したTutorialViewControllerを全画面表示でモーダル表示
            mainVC.modalPresentationStyle = .fullScreen
            // モーダル表示時のアニメーションをクロスディゾルブに設定
            mainVC.modalTransitionStyle = .crossDissolve
            // TutorialViewControllerを表示
            self.present(mainVC, animated: true)
        } catch let signOutError as NSError {
            // ログアウトに失敗した場合にエラーメッセージを出力
            print ("Error signing out: ", signOutError)
        }
    }

}
