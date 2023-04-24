//
//  GIPTabVC.swift
//  Giphy
//
//  Created by Адель Ахметшин on 24.04.2023.
//

import UIKit

final class GIPTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }

    // MARK: - TabBars
    private func setupTabs() {
        let mainVC = GIPMainVC()
        let searchVC = GIPSearchVC()
        let profileVC = GIPProfileVC()
        
        mainVC.navigationItem.largeTitleDisplayMode = .automatic
        searchVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: searchVC)
        let nav3 = UINavigationController(rootViewController: profileVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Popular GIFs",
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search for GIFs",
                                       image: UIImage(systemName: "magnifyingglass"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Profile",
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
