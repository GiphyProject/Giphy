//
//  ProfileCoordinator.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import Foundation
import UIKit

final class ProfileCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Start method
    func start() -> UIViewController {
        let profileViewController = GIPProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(
            title: Str.titleProfileViewController,
            image: UIImage(systemName: "person"),
            tag: 2
        )
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(profileViewController, animated: true)
        return navigationController
    }
}
