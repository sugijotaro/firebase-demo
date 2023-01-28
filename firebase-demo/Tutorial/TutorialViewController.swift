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
    
    @IBAction func LoginButtonTapped() {
        let authViewController = self.authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
    
    public func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?){
        if let error = error {
            print(error)
        }

        let db = Firestore.firestore()
        let userRef = db.collection("users").document(Auth.auth().currentUser!.uid)
        userRef.getDocument { (snapshot, error) in
            print(snapshot)
            if let error = error {
                print(error)
                return
            }
            if snapshot?.exists == true {
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView") as UIViewController
                mainVC.modalPresentationStyle = .fullScreen
                mainVC.modalTransitionStyle = .crossDissolve
                self.present(mainVC, animated: true)
            } else {
                self.performSegue(withIdentifier: "toSignUp", sender: nil)
            }
        }

    }
    
}

    
