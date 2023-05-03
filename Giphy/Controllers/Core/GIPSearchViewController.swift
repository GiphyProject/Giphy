//
//  GIPFavoriteVC.swift
//  Giphy
//
//  Created by Стас on 24.04.2023.
//

import UIKit

final class GIPSearchViewController: UIViewController {
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupBehavior()
        setupConstraints()
    }
    
    // MARK: - Embed view
    private func embedView() {
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        view.backgroundColor = .systemBackground
        title = Str.titleSearchViewController
    }
    
    private func setupConstraints() {
    }
    
}
