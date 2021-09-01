//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by Jiyoung Park on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary //.camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate,
                          UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
// # method1

//        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
//            imageView.image = image
//        }
     
// # method 2
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        imageView.image = image
    
        //print("\(info)")
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
