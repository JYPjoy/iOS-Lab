//
//  Constants.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/03.
//

import Foundation

struct K {
    
    struct ReuseIdentifier {
        static let onboardingCollectionViewCell = "cellID"
    }
    
    struct NavigationTitle {
        static let settings = "Settings"
        static let home = "Home"
    }
    
    struct Segue {
        static let showOnboarding = "showOnboarding"
        static let showLoginSignUp = "showLoginsignUp"
    }
    
    struct StorboardID {
        static let main = "Main" //Main.storyboard
        static let MainTabBarController = "MainTabBarController"
        static let onboardingViewController = "OnboardingController"
    }
}
