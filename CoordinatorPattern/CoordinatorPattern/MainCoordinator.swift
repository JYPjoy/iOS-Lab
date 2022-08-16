//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Jiyoung Park on 2022/08/14.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator]? = nil
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            var vc: UIViewController & Coordinating = SecondViewController()
            vc.coordiator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordiator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
}
