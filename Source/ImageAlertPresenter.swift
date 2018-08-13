//
//  ImageAlertPresenter.swift
//  ImageAlertPresenter
//
//  Created by Kevin Johnson on 3/26/18.
//  Copyright © 2018 FFR. All rights reserved.
//

import UIKit

protocol ImageAlertPresenterDelegate: class {
    func completed()
}

class ImageAlertPresenter: NSObject {
    
    // MARK: - Variables
    
    public weak var image: UIImage!
    public weak var delegate: ImageAlertPresenterDelegate?
    public var config: ImageAlertPresenterConfig!
    private weak var root: UIViewController!
    
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
        let alertController = createAlertController()
        root.present(alertController, animated: true, completion: {
            if self.config.message == nil { // if didn't configure, remove - have to add in first place for 1pt line to show above actions
                alertController.message = nil
            }
        })
    }
    
    // MARK: - Alert Controller
    
    private func createAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: config.title, message: config.message ?? "remove", preferredStyle: .alert)
        addActionsToAlertController(alertController: alertController)
        createImageViewForAlertControllerView(alertControllerView: alertController.view)
        return alertController
    }
    
    private func addActionsToAlertController(alertController: UIAlertController) {
        let cancel = UIAlertAction(title: config.cancelTitle, style: .destructive)
        alertController.addAction(cancel)
        let complete = UIAlertAction(title: config.completeTitle, style: .default) { _ in
            self.delegate?.completed()
        }
        alertController.addAction(complete)
    }
    
    // MARK: - Image View
    
    private func createImageViewForAlertControllerView(alertControllerView: UIView) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = config.imageViewContentMode
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alertControllerView.addSubview(imageView)
        addConstraintsToImageView(imageView: imageView, alertControllerView: alertControllerView)
    }
    
    private func addConstraintsToImageView(imageView: UIImageView, alertControllerView: UIView) {
        addPositioningConstraintsToImageView(imageView: imageView, alertControllerView: alertControllerView)
        addSizingConstraintsToImageView(imageView: imageView, alertControllerView: alertControllerView)
    }
    
    private func addPositioningConstraintsToImageView(imageView: UIImageView, alertControllerView: UIView) {
        alertControllerView.addConstraints([NSLayoutConstraint(item: imageView,
                                                                     attribute: .top,
                                                                     relatedBy: .equal,
                                                                     toItem: alertControllerView,
                                                                     attribute: .top,
                                                                     multiplier: 1.0,
                                                                     constant: config.imageViewVerticalOffset + additionalTopOffsetForImageView()),
                                             NSLayoutConstraint(item: imageView,
                                                                     attribute: .bottom,
                                                                     relatedBy: .equal,
                                                                     toItem: alertControllerView,
                                                                     attribute: .bottom,
                                                                     multiplier: 1.0,
                                                                     constant: -config.imageViewVerticalOffset - 44.0),
                                             NSLayoutConstraint(item: imageView,
                                                                     attribute: .centerX,
                                                                     relatedBy: .equal,
                                                                     toItem: alertControllerView,
                                                                     attribute: .centerX,
                                                                     multiplier: 1.0,
                                                                     constant: 0)])
    }
    
    private func additionalTopOffsetForImageView() -> CGFloat {
        // TODO: Improve, assumes message label is 1 line..
        if config.title != nil && config.message != nil {
            return 48.0
        } else if config.title != nil || config.message != nil {
            return 28.0
        }
        return 0.0
    }
    
    private func addSizingConstraintsToImageView(imageView: UIImageView, alertControllerView: UIView) {
        if let imageViewHeight = config.imageViewHeight {
            alertControllerView.addConstraint(NSLayoutConstraint(item: imageView,
                                                                       attribute: .height,
                                                                       relatedBy: .equal,
                                                                       toItem: nil,
                                                                       attribute: .height,
                                                                       multiplier: 1.0,
                                                                       constant: imageViewHeight))
        }
        if let imageViewWidth = config.imageViewWidth {
            alertControllerView.addConstraint(NSLayoutConstraint(item: imageView,
                                                                       attribute: .width,
                                                                       relatedBy: .equal,
                                                                       toItem: nil,
                                                                       attribute: .width,
                                                                       multiplier: 1.0,
                                                                       constant: imageViewWidth))
        }
    }
}
