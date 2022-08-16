//
//  ViewController.swift
//  CoordinatorPattern
//
//  Created by Jiyoung Park on 2022/08/14.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordiator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemGreen
        button.setTitle("Tap Me!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    @objc func didTapButton() {
        coordiator?.eventOccured(with: .buttonTapped)
    }

}

