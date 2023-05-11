//
//  GIPTabViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 24.04.2023.
//

import UIKit
import SOTabBar

final class GIPTabViewController: SOTabBarController {
    
    private var coordinators: [Coordinator] = []
    
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = Asset.orange.color
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
        SOTabBarSetting.tabBarHeight = 50.0
        SOTabBarSetting.tabBarBackground = Asset.gray.color
        SOTabBarSetting.tabBarSizeImage = 38
        SOTabBarSetting.tabBarSizeSelectedImage = 30
    }
    
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
