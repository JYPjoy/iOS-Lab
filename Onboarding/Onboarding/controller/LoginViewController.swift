//
//  LoginViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/05.
//

import UIKit
import MBProgressHUD
import FirebaseAuth

class LoginViewController: UIViewController {
    
    weak var delegate: OnboardingDelegate?
    private let authManager = AuthManager()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private enum PageType {
        case login
        case signUp
    }
    
    private var currentPageType: PageType = .login {
        didSet { // 값이 저장된 후 호출됨
            setupViewsFor(pageType: currentPageType)
        }
    }
    
    private var errorMessage: String? {
        didSet {
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsFor(pageType: .login)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailTextField.keyboardType = .emailAddress //inspector에서도 설정 가능
        emailTextField.textContentType = .emailAddress
        emailTextField.becomeFirstResponder() //email칸에 커서 놓이고, 키보드 pop-up
        passwordTextField.isSecureTextEntry = true //automask
        passwordTextField.textContentType = .password
        passwordConfirmationTextField.isSecureTextEntry = true
        passwordConfirmationTextField.textContentType = .password
    }
    
    
    //segment에 따라 보여질 요소 결정
    private func setupViewsFor(pageType: PageType) {
        errorMessage = nil
        passwordConfirmationTextField.isHidden = pageType == .login //login화면이라면 true라 hidden됨
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    //에러 메시지
    private func showErrorMessageIfNeeded(text: String?) {
        errorLabel.isHidden = text == nil
        errorLabel.text = text
    }
    

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    //send Events: value changed
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
//        if sender.selectedSegmentIndex == 0 {
//            currentPageType = .login
//        } else {
//            currentPageType = .signUp
//        }
    }
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
//        let email = "abc@example.com"
//        let password = "12345678"
        
        guard let email = emailTextField.text,
            !email.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty,
            let passwordConfirmation = passwordConfirmationTextField.text,
            !passwordConfirmation.isEmpty else {
            showErrorMessageIfNeeded(text: "Invalid form")
            return
        }
        
        guard password == passwordConfirmation else {
            showErrorMessageIfNeeded(text: "Passwords are incorrect")
            return
        }
        
        //print("email: \(email), password: \(password)")
        MBProgressHUD.showAdded(to: view, animated: true)
        
        authManager.signUpNewUser(withEmail: email, password: password) { [weak self] (result) in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            switch result {
            case .success:
                this.delegate?.showMainTabBarController()
            case .failure(let error):
                this.showErrorMessageIfNeeded(text: error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        view.endEditing(true) //dismiss keyboard, move focus to progress bar
        
        guard let email = emailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty else {
            showErrorMessageIfNeeded(text: "Invalid form")
            return
        }
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        authManager.loginUser(withEmail: email, password: password) { [weak self] (result) in
            guard let this = self else { return }
            MBProgressHUD.hide(for: this.view, animated: true)
            
            switch result {
            case .success: //성공
                this.delegate?.showMainTabBarController()
            case .failure(let error): //에러
                this.showErrorMessageIfNeeded(text: error.localizedDescription)

            }
        }
    }
    
}
