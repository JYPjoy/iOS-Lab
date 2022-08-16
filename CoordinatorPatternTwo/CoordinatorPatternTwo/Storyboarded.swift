//
//  Storyboard.swift
//  CoordinatorPatternTwo
//
//  Created by Jiyoung Park on 2022/08/15.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instatiate() -> Self
}

extension Storyboarded where Self: UIViewController{
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
