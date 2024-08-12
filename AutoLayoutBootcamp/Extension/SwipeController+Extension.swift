//
//  SwipeController+Extension.swift
//  AutoLayoutBootcamp
//
//  Created by Swan Nay Phue Aung on 12/08/2024.
//
import UIKit
import Foundation

extension SwipeController {
    
    // this is for fixing the UI whenever orientation changes
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        //invlidate whenever orientation changes
        coordinator.animate(alongsideTransition: { _ in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        })

        
    }
    
}

