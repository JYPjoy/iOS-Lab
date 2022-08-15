//
//  giverVC.swift
//  give_take_data
//
//  Created by Jiyoung Park on 2022/08/14.
//

import UIKit

protocol calculateDelegate {
    func addNumber(number: Int?)
}

class giverVC: UIViewController {

    @IBOutlet weak var calculateBtn: UIButton!
    var original: Int? = 10
    var addDelegate: calculateDelegate!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateNum(_ sender: UIButton){
        self.addDelegate.addNumber(number: original)
        self.dismiss(animated: false)
      
    }


}
