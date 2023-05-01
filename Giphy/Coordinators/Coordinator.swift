//
//  Coordinator.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start() -> UIViewController
}
