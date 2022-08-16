//
//  Coordinator.swift
//  CoordinatorPatternTwo
//
//  Created by Jiyoung Park on 2022/08/15.
//

import Foundation
import UIKit

protocol Coordinator{
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController { get set }
    func start()
}
