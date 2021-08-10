//
//  LoadingViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit
import FirebaseAuth

class LoadingViewController: UIViewController {
    
    //Handle login state at app launch
    private var isUserLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
    //Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ///시간 Delay : 2초 후
        delay(durationInSeconds: 2.0) {
            self.showInitialView()
        }
    }
    
    private func showInitialView() {
        if isUserLoggedIn {
            // if user is logged in => main tab bar controller(storyID: MainTabBarController)
            PresenterManager.shared.show(vc: .mainTabBarController)

        } else {
            // if user is NOT logged in => show onboarding controller(storyID: OnboardingController)
            performSegue(withIdentifier: K.Segue.showOnboarding, sender: nil)
        }
    }
}
