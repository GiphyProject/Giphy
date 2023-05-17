//
//  GIPProfileVC.swift
//  Giphy
//
//  Created by Стас on 24.04.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class GIPProfileViewController: UIViewController {
    
    private let profileView = GIPProfileView()
    private let disposeBag = DisposeBag()
    var viewModel: GIPProfileViewViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        embedView()
        setupBehavior()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.cellBindingWithGifs(profileView)
    }
    
    // MARK: - Embed view
    private func embedView() {
        view.addSubview(profileView)
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        view.backgroundColor = .systemBackground
        title = Str.titleProfileViewController
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        profileView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
