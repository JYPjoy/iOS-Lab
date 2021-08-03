//
//  PresenterManager.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit

class PresenterManager {
    
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabBarController
        case onboarding
    }
    
    func show(vc: VC) {
        var viewController: UIViewController
        
        switch vc {
        case .mainTabBarController:
            /// maintabbar : storyboard -> viewController
            viewController = UIStoryboard(name: K.StorboardID.main, bundle:
                nil).instantiateViewController(identifier: K.StorboardID.MainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.StorboardID.main, bundle:
                nil).instantiateViewController(identifier: K.StorboardID.onboardingViewController)
        }
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
