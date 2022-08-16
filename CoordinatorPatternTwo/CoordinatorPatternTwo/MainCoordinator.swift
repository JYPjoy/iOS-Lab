//
//  MainCoordinator.swift
//  CoordinatorPatternTwo
//
//  Created by Jiyoung Park on 2022/08/16.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordniator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription(){
        let vc = BuyViewController.instantiate()
        vc.coordniator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordniator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
