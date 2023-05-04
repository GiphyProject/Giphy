//
//  GIPDetailView.swift
//  Giphy
//
//  Created by Адель Ахметшин on 27.04.2023.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class GIPDetailView: UIView {
    
    private let disposeBag = DisposeBag()
    
    // MARK: - UI elements
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .tertiarySystemBackground
        imageView.layer.cornerRadius = 10
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowRadius = 4
        return imageView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(
            systemName: Str.likeButton,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 80, weight: .regular)
        )
        button.setImage(image, for: .normal)
        button.tintColor = .red
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        let image = UIImage(
            systemName: Str.shareButton,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 75, weight: .regular)
        )
        button.setImage(image, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedView()
        setupConstraints()
        setupAppearance()
        setupBehavior()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    private func embedView() {
        addSubviews(imageView, likeButton, shareButton)
    }
    
    // MARK: - Setup appearance
    private func setupAppearance() {
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        buttonActions()
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        
        // Image view
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
            make.width.equalTo(330)
            make.height.equalTo(250)
        }
        
        // Like button
        likeButton.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading).offset(20)
            make.top.equalTo(imageView.snp.bottom).offset(35)
        }
        
        // Share button
        shareButton.snp.makeConstraints { make in
            make.trailing.equalTo(imageView.snp.trailing).offset(-20)
            make.top.equalTo(imageView.snp.bottom).offset(35)
        }
    }
    
    // MARK: - Button actions
    private func buttonActions() {
        likeButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: {
                print("TEXT")
            }).disposed(by: disposeBag)
    }
}
