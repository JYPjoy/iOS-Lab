//
//  SettingsViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import UIKit
import MBProgressHUD

//NavigationController -> Item2
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.settings
    }

    @IBAction func logoutbuttonTapped(_ sender: UIBarButtonItem) {
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            PresenterManager.shared.show(vc: .onboarding)
        }
    }
}
