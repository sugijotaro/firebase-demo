//
//  TutorialViewController.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/29.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseOAuthUI
import FirebaseGoogleAuthUI

class TutorialViewController: UIViewController, FUIAuthDelegate {
    // FirebaseUIのインスタンスを生成
    let authUI = FUIAuth.defaultAuthUI()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // FirebaseUIで使用するプロバイダーを設定
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(authUI: authUI), // Google認証のプロバイダー
            FUIOAuth.appleAuthProvider() // Apple認証のプロバイダー
        ]
        // 自分自身をDelegateに設定
        self.authUI.delegate = self
        // FirebaseUIに使用するプロバイダーを設定
        self.authUI.providers = providers
    }
    
    // ログインボタンがタップされた時に呼ばれるアクション
    @IBAction func LoginButtonTapped() {
        // FirebaseUIの認証画面を生成
        let authViewController = self.authUI.authViewController()
        // FirebaseUIの認証画面を表示
        self.present(authViewController, animated: true, completion: nil)
    }
    
    // ログインが完了した際に呼ばれるデリゲートメソッド
    public func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        // エラーがあった場合はエラーを表示
        if let error = error {
            print(error)
        }
        
        // Firestoreから現在ログインしているユーザーの情報を取得
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(Auth.auth().currentUser!.uid)
        userRef.getDocument { (snapshot, error) in
            if let error = error {
                // エラーがあった場合はエラーを表示
                print(error)
                return
            }
            if snapshot?.exists == true {
                // ユーザーが既に登録されている場合はHome画面に遷移
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as UIViewController
                mainVC.modalPresentationStyle = .fullScreen
                mainVC.modalTransitionStyle = .crossDissolve
                self.present(mainVC, animated: true)
            } else {
                // ユーザーが未登録の場合はSignUp画面に遷移
                self.performSegue(withIdentifier: "toSignUp", sender: nil)
            }
        }
    }
    
}
