//
//  ViewController.swift
//  adpieSwift
//
//  Created by apple on 2021/11/30.
//

import UIKit
import SnapKit


class ViewController: UIViewController{

    private let bannerBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("배너 광고 연동", for: .normal)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let interStitialBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("전면 광고 연동", for: .normal)
        btn.backgroundColor = .systemYellow
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let nativeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("네이티브 광고 연동", for: .normal)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    private let nativeTableBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("네이티브 테이블 광고 연동", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubViews()
        addBtnAction()
    }
    
    //위치 설정
    // * 코드 -> autoLayout 다시 적용
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bannerBtn.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(80)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

        interStitialBtn.snp.makeConstraints { make in
            make.top.equalTo(bannerBtn.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

        nativeBtn.snp.makeConstraints { make in
            make.top.equalTo(interStitialBtn.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

        nativeTableBtn.snp.makeConstraints { make in
            make.top.equalTo(nativeBtn.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }

    }
        
    private func addSubViews(){
        view.addSubview(bannerBtn)
        view.addSubview(interStitialBtn)
        view.addSubview(nativeBtn)
        view.addSubview(nativeTableBtn)
    }
    
    private func addBtnAction(){
        bannerBtn.addTarget(self, action: #selector(didTapBanner), for: .touchUpInside)
        interStitialBtn.addTarget(self, action: #selector(didTapInterStitial), for: .touchUpInside)
        nativeBtn.addTarget(self, action: #selector(didTapNative), for: .touchUpInside)
        nativeTableBtn.addTarget(self, action: #selector(didTapNativeTable), for: .touchUpInside)
    }

    
    @objc func didTapBanner() {
        //나중에 navigation으로 바꾸기
//        let navVC = UINavigationController(rootViewController: BannerAdVC())
//        navVC.modalPresentationStyle = .fullScreen
//        self.present(navVC, animated: true)
        print("hello, I'm Banner")
        let vc = BannerAdVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    

    @objc func didTapInterStitial() {
        print("hello, insterStitial")
        let vc = InterstitialAdVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func didTapNative(){
//        print("hello Native")
//        let vc = NativeAdVC()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
    }
    
    @objc func didTapNativeTable() {
//        print("hello nativeTable")
//        let vc = NativeTableAdVC()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
    }
}

