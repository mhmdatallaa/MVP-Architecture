//
//  UITableView+Extensions.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 31/10/2025.
//

import UIKit


extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath)
        return cell as! T
    }
}


extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}
