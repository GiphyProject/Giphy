//
//  AppCoordinator.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    // MARK: - Init
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = GIPTabViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
}
