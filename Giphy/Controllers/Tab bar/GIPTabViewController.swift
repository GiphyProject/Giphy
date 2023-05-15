//
//  GIPTabViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 24.04.2023.
//

import UIKit

final class GIPTabViewController: UITabBarController {
    
    private var coordinators: [Coordinator] = []
    private var profileModel = GIPProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    // MARK: - TabBars
    private func setupTabs() {
        
        let mainViewCoordinator = MainCoordinator(navigationController: UINavigationController(), profileModel: profileModel)
        let mainViewController = mainViewCoordinator.start()
        coordinators.append(mainViewCoordinator)
        
        let searchViewCoordinator = SearchCoordinator(navigationController: UINavigationController())
        let searchViewController = searchViewCoordinator.start()
        coordinators.append(searchViewCoordinator)
        
        let profileViewCoordinator = ProfileCoordinator(navigationController: UINavigationController(), profileModel: profileModel)
        let profileViewController = profileViewCoordinator.start()
        coordinators.append(profileViewCoordinator)
        
        viewControllers = [mainViewController, searchViewController, profileViewController]
    }
}
