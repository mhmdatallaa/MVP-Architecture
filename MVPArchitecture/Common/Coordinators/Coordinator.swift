//
//  Coordinator.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

protocol Coordinator {
    init(factory: Factory, navigationController: UINavigationController)
    
    func start(window: UIWindow?)
}
