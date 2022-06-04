//
//  BannerAdVC.swift
//  adpieSwift
//
//  Created by apple on 2021/11/30.
//

// *******
// adViewResultLabel 추가하기

import UIKit
import AdPieSDK

class BannerAdVC: UIViewController, APAdViewDelegate {

    private var adView: APAdView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let bannerSize = CGSize(width: view.bounds.width, height: 50)
        let originX = (view.bounds.size.width - bannerSize.width) / 2
        let originY = view.bounds.size.height - bannerSize.height - 100

        adView = APAdView(frame: CGRect(x: originX, y: originY, width: bannerSize.width, height: bannerSize.height))

        view.addSubview(adView)


        // 광고뷰에 Slot ID
        adView.slotId = "57342fdd7174ea39844cac15" //예제 부분에 나온 키 값
        //adView.slotId = "619b175065a17f6519f34fe7" //팀장님께서 보내주신 키 값
        adView.rootViewController = self
        adView.delegate = self
        adView.load()

        if #available(iOS 13, *) {
            view.backgroundColor = .systemBackground
        }
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }


    //MARK: -Delegate
    func adViewDidLoadAd(_ view: APAdView!) {

    }

    func adViewDidFail(toLoadAd view: APAdView!, withError error: Error!) {

    }
}


