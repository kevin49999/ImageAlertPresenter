//
//  ViewController.swift
//  ImageAlertPresenter
//
//  Created by Kevin Johnson on 3/26/18.
//  Copyright © 2018 FFR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBAction
    
    @IBAction func tapPresent(_ sender: UIButton) {
        let imageAlert = ImageAlertPresenter.init(root: self, image: #imageLiteral(resourceName: "beach"), config: ImageAlertPresenterConfig(title: "Title", message: "Message"))
        imageAlert.delegate = self
        imageAlert.present()
    }
}

// MARK: - ImageAlertPresenterDelegate

extension ViewController: ImageAlertPresenterDelegate {
    func completed() {
        print("Completed")
    }
}

