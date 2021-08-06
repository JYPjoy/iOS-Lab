//
//  OnboardingCollectionViewCell.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/05.
//

import UIKit

class OnboadingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    func configure(image: UIImage) {
        slideImageView.image = image
    }
    
}
