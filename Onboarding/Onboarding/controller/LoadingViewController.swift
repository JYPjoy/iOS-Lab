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
        setupViews()
    }
    
    //Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ///시간 Delay : 2초 후
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showInitialView()
        }
    }
    
    
    private func setupViews() {
        view.backgroundColor = .orange
    }
    
    private func showInitialView() {
    
        if isUserloggedIn {
            // if user is logged in => main tab bar controller(storyID: MainTabBarController)
            /// storyboard -> viewController
            let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainTabBarController")
            
            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
               let window = sceneDelegate.window {
                window.rootViewController = mainTabBarController
            }
           
        } else {
            // if user is NOT logged in => show onboarding controller
            performSegue(withIdentifier: "showOnboarding", sender: nil)
        }
    }
}
