//
//  GIPDetailViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import UIKit
import SnapKit

class GIPDetailViewController: UIViewController {

    private let detailView = GIPDetailView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupAppearance()
        setupBehavior()
        setupConstraints()
    }
    
    // MARK: - Embed view
    private func embedView() {
        view.addSubview(detailView)
    }
    
    // MARK: - Setup Appearance
    private func setupAppearance() {
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        detailView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
