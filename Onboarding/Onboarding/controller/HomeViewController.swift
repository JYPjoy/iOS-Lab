//
//  HomeViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/06.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.home
    }
}
