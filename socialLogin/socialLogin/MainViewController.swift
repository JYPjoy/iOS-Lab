//
//  MainViewController.swift
//  socialLogin
//
//  Created by Jiyoung Park on 2021/11/10.
//

import UIKit
import SnapKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class MainViewController: UIViewController {
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "소셜 로그아웃"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let kakaoLogoutBtn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("카카오 로그아웃", for:  .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    private let appleLogoutBtn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("애플 로그아웃", for:  .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    private let naverLogoutBtn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.setTitle("네이버 로그아웃", for:  .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    private let googleLogoutBtn: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("구글 로그아웃", for:  .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        addBtnAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(kakaoLogoutBtn)
        view.addSubview(appleLogoutBtn)
        view.addSubview(naverLogoutBtn)
        view.addSubview(googleLogoutBtn)
    }
    
    private func addBtnAction() {
        kakaoLogoutBtn.addTarget(self, action: #selector(didTapKakaoLogout), for: .touchUpInside)
        appleLogoutBtn.addTarget(self, action: #selector(didTapAppleLogout), for: .touchUpInside)
        naverLogoutBtn.addTarget(self, action: #selector(didTapNaverLogout), for: .touchUpInside)
        googleLogoutBtn.addTarget(self, action: #selector(didTapGoogleLogout), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(60)
        }
        
        
        kakaoLogoutBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        appleLogoutBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(kakaoLogoutBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        naverLogoutBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(appleLogoutBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
        googleLogoutBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(naverLogoutBtn.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
        
    }
    
    @objc func didTapKakaoLogout() {
        print("Logout Kakao")
        
        // 로그 아웃
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
        
        // 연결 끊기
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
        gotoSignIn()
        
    }
    
    @objc func didTapAppleLogout() {
        print("Logout Apple")
        gotoSignIn()
    }
    
    @objc func didTapNaverLogout() {
        print("Logout Naver")
        gotoSignIn()
    }
    
    @objc func didTapGoogleLogout() {
        print("Logout Google")
        gotoSignIn()
    }
    
    private func gotoSignIn() {
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}
