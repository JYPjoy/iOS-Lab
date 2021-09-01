//
//  ViewController.swift
//  FirestoreExample
//
//  Created by Jiyoung Park on 2021/07/10.
//
import FirebaseFirestore
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // UIViewController : class UIKit
    // UITextFieldDelegate : protocol. A set of optional methods to manage the editing and validation of text in a text field object.
    
    let database = Firestore.firestore()
    

    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text..."
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.keyboardType = .asciiCapable
        field.autocapitalizationType = .none
        return field
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(field)
        field.delegate = self
        
        // [Read] : https://firebase.google.com/docs/firestore/query-data/get-data?hl=ko
        let docRef = database.document("textfield/example")
        
        //실시간
        //Q. [weak self]랑 self?
        docRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }

            guard let text = data["text"] as? String else {
                return
            }

            DispatchQueue.main.async {
                self?.label.text = text //label에 textfield의 값 입력
            }
        }
        
//        docRef.getDocument { [weak self] snapshot, error in
//            guard let data = snapshot?.data(), error == nil else {
//                return
//            }
//
//            guard let text = data["text"] as? String else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.label.text = text //label에 textfield의 값 입력
//            }
//        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        field.frame = CGRect(x: 10,
                             y: view.safeAreaInsets.top+10,
                             width: view.frame.size.width-20,
                             height: 50)
        
        label.frame = CGRect(x: 10,
                             y: view.safeAreaInsets.top+10+60,
                             width: view.frame.size.width-20,
                             height: 100)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Asks the delegate whether to process the pressing of the Return button for the text field.
        
        if let text = textField.text, !text.isEmpty {
            saveData(text: text)
        }
        return true
    }
    
    // [Write]: https://firebase.google.com/docs/firestore/manage-data/add-data?hl=ko
    func saveData(text: String) {
        let docRef = database.document("textfield/example") // collection/document
        docRef.setData(["text": text]) //parameter로 받아온 text가 입력됨
    }
}

