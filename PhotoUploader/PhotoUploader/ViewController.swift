//
//  ViewController.swift
//  PhotoUploader
//
//  Created by Jiyoung Park on 2021/09/01.
//  Firebase: Storage

import UIKit
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    private let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        label.numberOfLines = 0
        label.textAlignment = .center
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
              let url = URL(string: urlString) else {
                return
        }
        
        label.text = urlString
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        
        task.resume()
    }

    @IBAction func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        guard let imageData = image.pngData() else {
            return
        }
        
        /*
         /Desttop/file.png
         */
            
        storage.child("images/file.png").putData(imageData,
                                                 metadata: nil,
                                                 completion: { success, error in
                                                    
                                                    guard error == nil else {
                                                        print("Failed to upload")
                                                        print(error)
                                                        return
                                                    }
                                                    
                                                    self.storage.child("images/file.png").downloadURL(completion:  { url, error in
                                                        guard let url = url, error == nil else {
                                                            return
                                                        }
                                                        
                                                        let urlString = url.absoluteString
                                                        
                                                        DispatchQueue.main.async {
                                                            self.label.text = urlString
                                                            self.imageView.image = image
                                                        }
                                                        
                                                        print("Download URL: \(urlString)")
                                                        UserDefaults.standard.set(urlString, forKey: "url")
                                                        
                                                    })
            
        })
        
        // upload image data
        // get download url
        // save download url to userDefaults
        
    }

  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }

}

