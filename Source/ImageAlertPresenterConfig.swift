//
//  ImageAlertPresenterConfig.swift
//  ImageAlertPresenter
//
//  Created by Kevin Johnson on 3/26/18.
//  Copyright © 2018 FFR. All rights reserved.
//

import UIKit

struct ImageAlertPresenterConfig {
    let title: String?
    let message: String?
    let cancelTitle: String
    let completeTitle: String
    let imageViewHeight: CGFloat?
    let imageViewWidth: CGFloat?
    let imageViewVerticalOffset: CGFloat
    let imageViewContentMode: UIViewContentMode
    
    init(title: String? =                               nil,
         message: String? =                             nil,
         cancelTitle: String =                          "Cancel",
         completeTitle: String =                        "Complete",
         imageViewHeight: CGFloat? =                    nil,
         imageViewWidth: CGFloat? =                     nil,
         imageViewVerticalOffset: CGFloat =             24.0,
         imageViewContentMode: UIViewContentMode =      .scaleAspectFill) {
        
        self.title = title
        self.message = message
        self.cancelTitle = cancelTitle
        self.completeTitle = completeTitle
        self.imageViewHeight = imageViewHeight
        self.imageViewWidth = imageViewWidth
        self.imageViewVerticalOffset = imageViewVerticalOffset
        self.imageViewContentMode = imageViewContentMode
    }
}
