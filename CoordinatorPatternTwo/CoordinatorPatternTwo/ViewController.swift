//
//  ViewController.swift
//  CoordinatorPatternTwo
//
//  Created by Jiyoung Park on 2022/08/15.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    weak var coordniator: MainCoordinator?
    
    @IBAction func buyTapped(_ sender: Any) {
        print("tappedn buy")
        coordniator?.buySubscription()
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordniator?.createAccount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

