//
//  BaseViewController.swift
//  MVPArchitecture
//
//  Created by Mohamed Atallah on 30/10/2025.
//

import UIKit

protocol BaseView: AnyObject {
    func startLoading()
    func stopLoading()
    func showError(with title: String, and message: String)
}

class BaseViewController<ViewProtocol, Presenter>: UIViewController where Presenter: BasePresenter<ViewProtocol> {
    
    // MARK: - Properties
    let presenter: Presenter
    
    // MARK: - Init
    init(presenter: Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Overridable methods
    func setupUI() { }
}

// MARK: - BaseView Protocol
extension BaseViewController: BaseView {
    func startLoading() {
        showLoader()
    }
    
    func stopLoading() {
        hideLoader()
    }
    
    func showError(with title: String, and message: String) {
        showAlert(with: title, and: message)
    }
    
    
}
