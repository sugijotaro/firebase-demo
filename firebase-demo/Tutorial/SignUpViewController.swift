//
//  SignUpViewController.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/29.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButtonTapped() {
        // ユーザーが入力した名前を取得
        if let name = nameTextField.text, !name.isEmpty {
            // 入力した名前を使用して、Userオブジェクトを作成
            let user = User(displayName: name, createdTime: Date(), uid: Auth.auth().currentUser!.uid)
            // UserDataStoreクラスのcreateUser関数を呼び出し、Firestoreに新しいユーザーを追加
            UserDataStore.createUser(user: user) { (success) in
                if success {
                    // ホーム画面に遷移
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as UIViewController
                    mainVC.modalPresentationStyle = .fullScreen
                    mainVC.modalTransitionStyle = .crossDissolve
                    self.present(mainVC, animated: true)
                } else {
                    print("Failed to create user")
                }
            }
        }
    }
    
}
