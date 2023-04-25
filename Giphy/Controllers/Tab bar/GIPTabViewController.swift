//
//  GIPTabViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 24.04.2023.
//

import UIKit

final class GIPTabViewController: UITabBarController {
    
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }

    // MARK: - TabBars
    private func setupTabs() {
        let mainViewController = GIPMainViewController()
        let searchViewController = GIPSearchViewController()
        let profileViewController = GIPProfileViewController()
        
        mainViewController.navigationItem.largeTitleDisplayMode = .automatic
        searchViewController.navigationItem.largeTitleDisplayMode = .automatic
        profileViewController.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: mainViewController)
        let nav2 = UINavigationController(rootViewController: searchViewController)
        let nav3 = UINavigationController(rootViewController: profileViewController)
        
        nav1.tabBarItem = UITabBarItem(title: Str.titleMainViewController,
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: Str.titleSearchViewController,
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: Str.titleProfileViewController,
                                       image: UIImage(systemName: "person"),
                                       tag: 3)
        
        for nav in [nav1, nav2, nav3] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [nav1, nav2, nav3],
            animated: true)
    }
}
