//
//  MainCoordinator.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var profileModel: GIPProfileModel
    
    // MARK: - Init
    init(navigationController: UINavigationController, profileModel: GIPProfileModel) {
        self.navigationController = navigationController
        self.profileModel = profileModel
    }
    
    // MARK: - Start method
    func start() -> UIViewController {
        let mainViewController = GIPMainViewController()
        let mainViewViewModel = GIPMainViewViewModel()
        mainViewController.tabBarItem = UITabBarItem(
            title: Str.titleMainViewController,
            image: UIImage(systemName: "house"),
            tag: 0
        )
        navigationController.navigationBar.prefersLargeTitles = true
        mainViewController.coordinator = self
        mainViewController.viewModel = mainViewViewModel
        navigationController.pushViewController(mainViewController, animated: true)
        return navigationController
    }
    
    // MARK: - Detail method
    func showDetail(_ gif: String) {
        let detailViewViewModel = GIPDetailViewViewModel(profileModel: profileModel)
        let detailViewController = GIPDetailViewController(gif, viewModel: detailViewViewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
