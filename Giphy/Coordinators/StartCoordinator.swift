//
//  StartCoordinator.swift
//  Giphy
//
//  Created by Стас on 03.05.2023.
//

import Foundation
import UIKit

final class StartCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start method
    func start() -> UIViewController {
        let startViewController = GIPStartViewController()
        let startViewViewModel = GIPStartViewViewModel()
        
        startViewController.coordinator = self
        startViewController.viewModel = startViewViewModel
        navigationController.pushViewController(startViewController, animated: true)
        return navigationController
    }
    
    // MARK: - Detail method
    func showMain() -> UIViewController {
        let viewController = GIPTabViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }
}
