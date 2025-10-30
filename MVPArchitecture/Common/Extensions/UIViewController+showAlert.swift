//
//  UIViewController+showAlert.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(cancel)
        
        present(alertController, animated: true) {
            guard let completion else { return}
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
