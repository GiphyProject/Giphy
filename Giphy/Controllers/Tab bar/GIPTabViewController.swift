//
//  GIPTabViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 24.04.2023.
//

import UIKit

final class GIPTabViewController: UITabBarController {
    
    private var coordinators: [Coordinator] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    // MARK: - TabBars
    private func setupTabs() {
        
        let mainViewCoordinator = MainCoordinator(navigationController: UINavigationController())
        let mainViewController = mainViewCoordinator.start()
        coordinators.append(mainViewCoordinator)
        
        let searchViewCoordinator = SearchCoordinator(navigationController: UINavigationController())
        let searchViewController = searchViewCoordinator.start()
        coordinators.append(searchViewCoordinator)
        
        let profileViewCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        let profileViewController = profileViewCoordinator.start()
        coordinators.append(profileViewCoordinator)
        
        viewControllers = [mainViewController, searchViewController, profileViewController]
    }
}
