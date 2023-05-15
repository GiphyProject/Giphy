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
    var profileModel: GIPProfileModel
    
    // MARK: - Init
    init(navigationController: UINavigationController, profileModel: GIPProfileModel) {
        self.navigationController = navigationController
        self.profileModel = profileModel
    }
    
    // MARK: - Start method
    func start() -> UIViewController {
        let profileViewController = GIPProfileViewController()
        let profileViewViewModel = GIPProfileViewViewModel(model: profileModel)
        profileViewController.tabBarItem = UITabBarItem(
            title: Str.titleProfileViewController,
            image: UIImage(systemName: "person"),
            tag: 2
        )
        profileViewController.viewModel = profileViewViewModel
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(profileViewController, animated: true)
        return navigationController
    }
}
