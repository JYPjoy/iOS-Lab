//
//  ViewController.swift
//  AdPieSwiftSample
//
//  Created by sunny on 2016. 10. 20..
//  Copyright © 2016년 GomFactory. All rights reserved.
//

import UIKit

class ViewController : UITableViewController {
    override func viewDidLoad() {
        if #available(iOS 13, *) {
            view.backgroundColor = .systemBackground
            tableView.backgroundColor = .systemBackground
        }
    }
}
