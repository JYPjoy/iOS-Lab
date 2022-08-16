//
//  SecondViewController.swift
//  CoordinatorPattern
//
//  Created by Jiyoung Park on 2022/08/15.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordiator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
        view.backgroundColor = .systemBlue
    }
    

}
