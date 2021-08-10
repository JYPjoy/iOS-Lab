//
//  LoginViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/05.
//

import UIKit
import MBProgressHUD
import Loaf

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
        let alertController = UIAlertController(title: "Forget Password", message: "Please enter your email address", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let this = self else { return }
            if let textField = alertController.textFields?.first,
               let email = textField.text,
               !email.isEmpty {
                this.authManager.resetPassword(withEmail: email) { (result) in
                    switch result {
                    case .success:
                        this.showAlert(title: "PasswordReset Successful", message: "Please check your email to find the password reset link.")
                    case .failure(let error):
                        Loaf(error.localizedDescription, state: .error, location: .top, sender: this).show()
                    }
                }
                print("process this email: \(email)")
            }
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
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
