//
//  UiViewController+activityIndicator.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

extension UIViewController {
    func showLoader() {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.startAnimating()
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.tag = 777
        view.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoader() {
        if let subView = view.viewWithTag(777) {
            subView.removeFromSuperview()
        }
    }
}

