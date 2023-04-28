//
//  SearchCoordinator.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import Foundation
import UIKit

final class SearchCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start method
    func start() -> UIViewController {
        let searchViewController = GIPSearchViewController()
        searchViewController.tabBarItem = UITabBarItem(
            title: Str.titleSearchViewController,
            image: UIImage(systemName: "magnifyingglass"),
            tag: 1
        )
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(searchViewController, animated: true)
        return navigationController
    }
}
