//
//  GIPDetailViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

class GIPDetailViewController: UIViewController {
    
    var viewModel: GIPDetailViewViewModel?
    private let detailView = GIPDetailView()
    private var gif: String
    
    init(_ gif: String) {
        self.gif = gif
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        detailView.imageView.kf.setImage(with: URL(string: gif))
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
