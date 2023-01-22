//
//  ViewController.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/22.
//

import UIKit
import FirebaseAuthUI
import FirebaseOAuthUI
import FirebaseGoogleAuthUI

class ViewController: UIViewController, FUIAuthDelegate {
    
    let authUI = FUIAuth.defaultAuthUI()!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(authUI: authUI),
            FUIOAuth.appleAuthProvider()
        ]
        self.authUI.delegate = self
        self.authUI.providers = providers
    }

    @IBAction func LoginButtonTapped(){
        let authViewController = self.authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
    
    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?){
        if error == nil {
            print("成功")
        } else {
            print(error!)
        }
    }
    
}

