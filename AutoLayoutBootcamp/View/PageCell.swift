//
//  PageCell.swift
//  AutoLayoutBootcamp
//
//  Created by Swan Nay Phue Aung on 12/08/2024.
//

import Foundation
import UIKit
class PageCell : UICollectionViewCell {
    
    
    var page : Page? {
        didSet {
            //this code will trigger every time page value is set or changed
            guard let unwrapped = page else { return }
            topImage.image = UIImage(named:unwrapped.imageName)
            let attributedString = NSMutableAttributedString(string: unwrapped.headerText, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor : UIColor.black
            ])
            attributedString.append(NSMutableAttributedString(string: "\n\n\n\(unwrapped.bodyText)", attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13),
                NSAttributedString.Key.foregroundColor : UIColor.gray
            ]))
            
            headingText.attributedText = attributedString
            headingText.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(topImage)
        addSubview(topContainerView)
        addSubview(headingText)
        setUpLayout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //bear image
     private let topImage : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "bear_first.png"))
        image.translatesAutoresizingMaskIntoConstraints = false //enables auto layout for image view
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //container
    private let topContainerView : UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    //description text
     private let headingText : UITextView = {
       let heading = UITextView()
        let attributedString = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ])
        attributedString.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you soon in our stores.", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor : UIColor.gray
        ]))
        heading.attributedText = attributedString
        
        
        heading.textAlignment = .center
        heading.isEditable = false
        heading.isScrollEnabled = false
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()

    
    private func setUpLayout(){
        
        //MARK: - Container
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //taking 50% of phone's height
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        //MARK: - Bear Image
        topImage.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        topImage.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        topImage.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        //MARK: - Heading text
        headingText.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 30).isActive = true
        headingText.leftAnchor.constraint(equalTo: leftAnchor,constant: 24).isActive = true
        headingText.rightAnchor.constraint(equalTo: rightAnchor,constant: -24).isActive = true
        
        headingText.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
