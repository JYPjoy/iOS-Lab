//
//  SettingsViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit
import MBProgressHUD
import Loaf

//NavigationController -> Item2
class SettingsViewController: UIViewController {
    
    private let authManager = AuthManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
//        delay(durationInSeconds: 3.0) { //to confirm that it works
//            Loaf("Hey this is come serious error here!", state: .error, location: .top, sender: self).show()
//        }
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.settings
    }

    @IBAction func logoutbuttonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) { [weak self] in
            
            guard let this = self else { return }
            
            let result = this.authManager.logoutUser()
            
            switch result {
            case .success:
                PresenterManager.shared.show(vc: .onboarding)
            case .failure(let error):
                Loaf(error.localizedDescription, state: .error, location: .top, sender: this).show()
            }
            MBProgressHUD.hide(for: this.view, animated: true)
            
        }
    }
}
