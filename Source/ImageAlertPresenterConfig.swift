//
//  ImageAlertPresenterConfig.swift
//  ImageAlertPresenter
//
//  Created by Kevin Johnson on 3/26/18.
//  Copyright © 2018 FFR. All rights reserved.
//

import UIKit

struct ImageAlertPresenterConfig {
    var cancelTitle: String!
    var completeTitle: String!
    var imageViewHeight: CGFloat?
    var imageViewWidth: CGFloat?
    var imageViewVerticalOffset: CGFloat!
    var imageViewContentMode: UIViewContentMode!
    
    init(cancelTitle: String = "Cancel",
         completeTitle: String = "Complete",
         imageViewHeight: CGFloat? = nil,
         imageViewWidth: CGFloat? = nil,
         imageViewVerticalOffset: CGFloat = 24.0,
         imageViewContentMode: UIViewContentMode = .scaleAspectFill) {
        
        self.cancelTitle = cancelTitle
        self.completeTitle = completeTitle
        self.imageViewHeight = imageViewHeight
        self.imageViewWidth = imageViewWidth
        self.imageViewVerticalOffset = imageViewVerticalOffset
        self.imageViewContentMode = imageViewContentMode
    }
}
