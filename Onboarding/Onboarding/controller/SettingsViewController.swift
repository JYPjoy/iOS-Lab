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
        PresenterManager.shared.show(vc: .onboarding)
    }
}
