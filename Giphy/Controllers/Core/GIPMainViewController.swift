//
//  GIPMainVC.swift
//  Giphy
//
//  Created by Стас on 24.04.2023.
//

import UIKit
import SnapKit

final class GIPMainViewController: UIViewController {
    
    private let mainView = GIPMainView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupBehavior()
        setupConstraints()
    }
    
    // MARK: - Embed view
    private func embedView() {
        view.addSubview(mainView)
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        view.backgroundColor = .systemBackground
        title = Str.titleMainViewController
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
