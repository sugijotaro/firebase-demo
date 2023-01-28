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
        do {
            try Auth.auth().signOut()
            let mainVC = UIStoryboard(name: "Tutorial", bundle: nil).instantiateViewController(withIdentifier: "TutorialView") as UIViewController
            mainVC.modalPresentationStyle = .fullScreen
            mainVC.modalTransitionStyle = .crossDissolve
            self.present(mainVC, animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: ", signOutError)
        }
    }

}

