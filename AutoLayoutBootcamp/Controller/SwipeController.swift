//
//  SwipeController.swift
//  AutoLayoutBootcamp
//
//  Created by Swan Nay Phue Aung on 07/07/2024.
//
import UIKit
import Foundation

class SwipeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages : [Page] = [
        Page(imageName: "bear_first", headerText: "Join us today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you soon in our stores."),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        Page(imageName: "leaf_third", headerText: "VIP memebers special services", bodyText: "The VIP members will get the privilege to participate in the event for free of charge. So, make sure to come if you have the membership")
        ]

   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        setUpBottomControllers()
        
    }
    
    //MARK: - Prev Button
    private let prevButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrevious() {
        //due to this pageControll won't exceed 0
        let nextIndex = max(pageControl.currentPage - 1,0) //it compares - values and 0 when pageControll becomes negative
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK: - Page Control
    lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = pages.count
        pageControl.currentPageIndicatorTintColor = .mainPink
        pageControl.pageIndicatorTintColor = .secondaryPink
        return pageControl
    }()
    
    //MARK: - Next Button
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        //due to this pageControll won't exceed 3
        let nextIndex = min(pageControl.currentPage + 1,pages.count-1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK: - Set Up Bottom StackView
    fileprivate func setUpBottomControllers(){
        let bottomControlStack = UIStackView(arrangedSubviews: [prevButton,pageControl,nextButton])
        bottomControlStack.distribution = .fillEqually
        bottomControlStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlStack)

        NSLayoutConstraint.activate([
            bottomControlStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStack.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    //for pageControl Indicators
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //x value will tell u when will the scroll view will stop dragging
        let x = targetContentOffset.pointee.x
        print(x,view.frame.width,x/view.frame.width)
        pageControl.currentPage = Int(x / view.frame.width)
        
    }

    
}
