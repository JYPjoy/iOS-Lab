//
//  ViewController.swift
//  DownloadImage
//
//  Created by Jiyoung Park on 2021/09/04.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let urlString = "https://iosacademy.io/assets/images/brand/icon.jpg"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.center = view.center
        
// [2] SDWebImage을 활용한 방법
//        imageView.sd_setImage(with: URL(string: urlString), completed: nil)
        imageView.sd_setImage(with: URL(string: urlString),
                              placeholderImage: UIImage(systemName: "photo"),
                              options: .continueInBackground,
                              completed: nil)
        
// [1] Manual 한 방법
        //fetchImage()
    }

// [1] Manual 한 방법
//    private func fetchImage() {
//        // get Data
//        // convert the data to image
//        // set image to imageView
//
//        guard let url = URL(string: urlString) else {
//            return
//        }
//
//        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in //<#T##(Data?, URLResponse?, Error?) -> Void#>
//            guard let data = data, error == nil else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                let image = UIImage(data: data)
//                self.imageView.image = image
//            }
//        }
//        getDataTask.resume()
//    }

}

