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
        if let name = nameTextField.text, !name.isEmpty {
            let user = User(displayName: name, createdTime: Date(), uid: Auth.auth().currentUser!.uid)
            UserDataStore.createUser(user: user) { (success) in
                if success {
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
