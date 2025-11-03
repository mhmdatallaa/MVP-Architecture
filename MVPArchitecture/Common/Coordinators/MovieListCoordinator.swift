//
//  MovieListCoordinator.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

final class MovieListCoordinator: Coordinator {
    
    // MARK: - Properties
    private var window: UIWindow?
    private let factory: Factory
    private let navigationController: UINavigationController

    // MARK: - Init
    init(factory: Factory, navigationController: UINavigationController = UINavigationController()) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    // MARK: - Public Methods
    func start(window: UIWindow?) {
        
        let movieListViewController = factory.makeMovieListViewController(self)
        navigationController.viewControllers = [movieListViewController]
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
