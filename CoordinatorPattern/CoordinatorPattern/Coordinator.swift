//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Jiyoung Park on 2022/08/14.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordiator: Coordinator? { get set }
}
