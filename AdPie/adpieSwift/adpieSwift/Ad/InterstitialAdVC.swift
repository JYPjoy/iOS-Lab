//
//  InterstitialAdVC.swift
//  adpieSwift
//
//  Created by apple on 2021/12/01.
// *** Ex ***

import UIKit
import AdPieSDK

class InterstitialAdVC: UIViewController, APInterstitialDelegate {

    private var interstitial: APInterstitial!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        interstitial = APInterstitial(slotId: "573430057174ea39844cac16")
        //interstitial = APInterstitial(slotId: "619b173465a17f6467d5ddfe")
        interstitial.delegate = self
        interstitial.load()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    private func addSubViews() {
        
    }

    private func addBtnAction() {
   
    }


    //action 추가하기
    // MARK: - APInterstitial delegates
       
   func interstitialDidLoadAd(_ interstitial: APInterstitial!) {
       // 광고 로딩 완료 후 이벤트 발생 (성공)
       
       // 광고 요청 후 즉시 노출하고자 할 경우 아래의 코드를 추가한다.
       if interstitial.isReady() {
           // 광고 표출
           interstitial.present(fromRootViewController: self)
       }
   }
   
   func interstitialDidFail(toLoadAd interstitial: APInterstitial!, withError error: Error!) {
   // 광고 요청 또는 표출 실패 후 이벤트 발생
       // error code : error._code
       // error message : error.localizedDescription
   }
   
   func interstitialWillPresentScreen(_ interstitial: APInterstitial!) {
       // 광고 표출 후 이벤트 발생
   }
   
   func interstitialWillDismissScreen(_ interstitial: APInterstitial!) {
       // 광고가 표출한 뒤 종료하기 전에 이벤트 발생
   }
   
   func interstitialDidDismissScreen(_ interstitial: APInterstitial!) {
       // 광고가 표출한 뒤 종료한 후 이벤트 발생
   }
   
   func interstitialWillLeaveApplication(_ interstitial: APInterstitial!) {
       // 광고 클릭 후 이벤트 발생
   }
    

}
