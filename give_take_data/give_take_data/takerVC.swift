//
//  takerVC.swift
//  give_take_data
//
//  Created by Jiyoung Park on 2022/08/14.
//

import UIKit


class takerVC: UIViewController, calculateDelegate{
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickBtn.addTarget(self, action: #selector(didTapClickBtn), for: .touchUpInside)
    }

    @objc func didTapClickBtn() {
        guard let alertVC = self.storyboard?.instantiateViewController(withIdentifier: "giverVC") as? giverVC else {return}
        //alertVC.original = 50
        alertVC.addDelegate = self
        alertVC.modalPresentationStyle = .overFullScreen
        self.present(alertVC, animated: false, completion: nil)
    }

    func addNumber(number: Int?) {
        guard let num = number as? Int else {return}
        print("덧셈 결과는", num + 10)
    }
}
