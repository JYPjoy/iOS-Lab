//
//  OnboardingViewController.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/04.
//

import UIKit

protocol OnboardingDelegate: class { //retain cycle
    func showMainTabBarController()
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl:UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGroupedBackground
        
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = Slide.collection.count
    }
    
    
    private func showCaption(atIndex index: Int) {
        let slide = Slide.collection[index]
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }

    @IBAction func getStartedButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segue.showLoginSignUp, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showLoginSignUp {
            if let destination = segue.destination as? LoginViewController {
                destination.delegate = self
            }
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    // UICollectionViewDataSource
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: K.ReuseIdentifier.onboardingCollectionViewCell, for: indexPath)
                as? OnboadingCollectionViewCell else {return UICollectionViewCell()}
        
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size //cell의 size 결정
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Slide의 사진 결정함
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // print("index: \(scrollView.contentOffset.x)") //0, 390, 780
        // print("frame: \(scrollView.frame.width)") // 390
        // print("\(collectionView.frame)") //(0.0, 0.0, 390.0, 390.0)
        // print("============")
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        pageControl.currentPage = index
    }
}


extension OnboardingViewController: OnboardingDelegate {
    func showMainTabBarController() {
        if let loginViewController = self.presentedViewController as? LoginViewController {
            
            // dismiss the login view controller
            /// ask parent dismiss the child
            loginViewController.dismiss(animated: true){
                // show main tab bar
                PresenterManager.shared.show(vc: .mainTabBarController)
            }
        }
    }
}
