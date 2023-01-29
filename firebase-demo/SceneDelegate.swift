//
//  SceneDelegate.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/22.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Firebase Authenticationのステートが変化した際に呼ばれるリスナーを追加
        Auth.auth().addStateDidChangeListener { (auth, user) in
            // userがnil（ログアウト状態）の場合
            if user == nil {
                // sceneがUIWindowSceneであることを確認
                guard let scene = (scene as? UIWindowScene) else {
                    // sceneがUIWindowSceneでない場合は何もしない
                    return
                }
                // UIWindowを作成し、windowプロパティに代入
                let window = UIWindow(windowScene: scene)
                self.window = window
                // 作成したUIWindowを画面に表示
                window.makeKeyAndVisible()
                
                //"Tutorial"という名前のStoryboardからTutorialViewControllerをインスタンス化
                let vc = UIStoryboard(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: "TutorialView") as! TutorialViewController
                // インスタンス化したTutorialViewControllerをUIWindowのrootViewControllerに設定
                window.rootViewController = vc
            }
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
