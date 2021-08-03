//
//  SettingsViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit

//NavigationController -> Item2
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .gray
    }
    
    @IBAction func logoutbuttonTapped(_ sender: UIBarButtonItem) {
        
        let onboardingViewController = UIStoryboard(name: K.StorboardID.main, bundle:
            nil).instantiateViewController(identifier: K.StorboardID.onboardingViewController)
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = onboardingViewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
    }
}
