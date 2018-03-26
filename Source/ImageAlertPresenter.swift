//
//  ImageAlertPresenter.swift
//  ImageAlertPresenter
//
//  Created by Kevin Johnson on 3/26/18.
//  Copyright © 2018 FFR. All rights reserved.
//

import UIKit

protocol ImageAlertPresenterDelegate: class {
    func canceled()
    func completed()
}

class ImageAlertPresenter: NSObject {
    
    // MARK: - Variables
    
    weak public var image: UIImage!
    weak public var delegate: ImageAlertPresenterDelegate?
    private weak var root: UIViewController!
    public var config: ImageAlertPresenterConfig!
    
    // MARK: - Init
    
    init(root: UIViewController, image: UIImage, config: ImageAlertPresenterConfig = ImageAlertPresenterConfig()) {
        super.init()
        self.root = root
        self.image = image
        self.config = config
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Present
    
    public func present() {
        let ac = UIAlertController.init(title: nil, message: "remove", preferredStyle: .alert) // Add message or will be missing 1pt line above the bottom action buttons
        
        let cancel = UIAlertAction.init(title: config.cancelTitle, style: .destructive) { _ in
            self.delegate?.canceled()
        }
        ac.addAction(cancel)
        let complete = UIAlertAction.init(title: config.completeTitle, style: .default) { _ in
            self.delegate?.completed()
        }
        ac.addAction(complete)
        
        let imageView = UIImageView.init(image: self.image)
        imageView.contentMode = config.imageViewContentMode
        imageView.clipsToBounds = true
        ac.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        ac.view.addConstraints([NSLayoutConstraint.init(item: imageView,
                                                        attribute: .top,
                                                        relatedBy: .equal,
                                                        toItem: ac.view,
                                                        attribute: .top,
                                                        multiplier: 1.0,
                                                        constant: config.imageViewVerticalOffset),
                                NSLayoutConstraint.init(item: imageView,
                                                        attribute: .bottom,
                                                        relatedBy: .equal,
                                                        toItem: ac.view,
                                                        attribute: .bottom,
                                                        multiplier: 1.0,
                                                        constant: -config.imageViewVerticalOffset - 44.0), // offset - bottom button height
                                NSLayoutConstraint.init(item: imageView,
                                                        attribute: .centerX,
                                                        relatedBy: .equal,
                                                        toItem: ac.view,
                                                        attribute: .centerX,
                                                        multiplier: 1.0,
                                                        constant: 0)])
        
        if let imageViewHeight = config.imageViewHeight {
            ac.view.addConstraint(NSLayoutConstraint.init(item: imageView,
                                                          attribute: .height,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .height,
                                                          multiplier: 1.0,
                                                          constant: imageViewHeight))
        }
        if let imageViewWidth = config.imageViewWidth {
            ac.view.addConstraint(NSLayoutConstraint.init(item: imageView,
                                                          attribute: .width,
                                                          relatedBy: .equal,
                                                          toItem: nil,
                                                          attribute: .width,
                                                          multiplier: 1.0,
                                                          constant: imageViewWidth))
        }
        
        root.present(ac, animated: true, completion: nil)
        ac.message = nil // Remove uneeded message after present
    }
}

