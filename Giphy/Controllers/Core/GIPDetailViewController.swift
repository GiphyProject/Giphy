//
//  GIPDetailViewController.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

class GIPDetailViewController: UIViewController {
    
    private let viewModel: GIPDetailViewViewModel
    private let detailView = GIPDetailView()
    private let disposeBag = DisposeBag()
    private var gif: String
    
    init(_ gif: String, viewModel: GIPDetailViewViewModel) {
        self.gif = gif
        self.viewModel = viewModel
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
        buttonActions()
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
    
    // MARK: - Button actions
    private func buttonActions() {
        detailView.likeButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: {
                    self.viewModel.addToFavorites(self.gif)
            }).disposed(by: disposeBag)
    }
}
