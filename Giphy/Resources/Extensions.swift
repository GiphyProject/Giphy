//
//  Extensions.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit

extension UIView {
    /// Функция для сокращения кода при добавлении view
    /// - Parameter views: views
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
