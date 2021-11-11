//
//  SignInViewController.swift
//  socialLogin
//
//  Created by Jiyoung Park on 2021/11/10.
//

import UIKit
import SnapKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class SignInViewController: UIViewController {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "소셜 로그인하기"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let emailTextField: UITextField = {
       let textField = UITextField()
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일로 로그인하기"
        return textField
    }()
    
    
    private let pwdTextField: UITextField  = {
       let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.keyboardType = .default
        textField.textContentType = .password
        textField.placeholder = "패스워드를 입력해주세요"
        return textField
    }()
    
    private let loginBtn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .systemPink
        btn.setTitle("로그인하기", for: .normal)
        return btn
    }()
    
    
    private let kakaoBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("카카오로 로그인하기", for: .normal)
        btn.layer.cornerRadius = 8
        //btn.setImage(UIImage(named: "kakao_login_medium_wide"), for: .normal)
        return btn
    }()
    
    
    private let appleBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("애플로 로그인하기", for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    

    private let naverBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("네이버로 로그인하기", for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    
    private let googleBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("구글로 로그인하기", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        addBtnAction()
    }


    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
  
        view.addSubview(pwdTextField)
        view.addSubview(loginBtn)
        view.addSubview(kakaoBtn)
        view.addSubview(appleBtn)
        view.addSubview(naverBtn)
        view.addSubview(googleBtn)
    }
    
    private func addBtnAction() {
        kakaoBtn.addTarget(self, action: #selector(didTapKakao), for: .touchUpInside)
        appleBtn.addTarget(self, action: #selector(didTapApple), for: .touchUpInside)
        naverBtn.addTarget(self, action: #selector(didTapNaver), for: .touchUpInside)
        googleBtn.addTarget(self, action: #selector(didTapGoogle), for: .touchUpInside)
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
      
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(60)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
            self.emailTextField.addBottomBorder(r: 0, g: 42, b: 255)
        }
        
        pwdTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
            self.pwdTextField.addBottomBorder(r: 0, g: 42, b: 255)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(pwdTextField.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        kakaoBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(loginBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        appleBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(kakaoBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        naverBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(appleBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        googleBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(naverBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
    }
    
    
    @objc func didTapKakao() {
        print("hello Kakao")
        
        if (UserApi.isKakaoTalkLoginAvailable()) {

            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something -> 여기서 관련 코드 구현해야 함
                    _ = oauthToken
                    
                    print("토큰 정보", oauthToken?.accessToken)
                }
            }
        }
        
        
        goToMain()
    }
    
    @objc func didTapApple() {
        print("hello Apple")
        goToMain()
    }
    
    @objc func didTapNaver() {
        print("hello Naver")
        goToMain()
    }
    
    @objc func didTapGoogle() {
        print("hello Google")
        goToMain()
    }
    
    
    private func goToMain() {
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}


extension UITextField {
    func addBottomBorder(r: Float, g: Float, b: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1).cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
