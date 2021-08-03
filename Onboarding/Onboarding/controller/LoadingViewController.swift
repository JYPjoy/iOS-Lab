//
//  LoadingViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserloggedIn = true
    
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
        if isUserloggedIn {
            // if user is logged in => main tab bar controller(storyID: MainTabBarController)
            PresenterManager.shared.show(vc: .mainTabBarController)

        } else {
            // if user is NOT logged in => show onboarding controller(storyID: OnboardingController)
            performSegue(withIdentifier: K.Segue.showOnboardingScreen, sender: nil)
        }
    }
}
