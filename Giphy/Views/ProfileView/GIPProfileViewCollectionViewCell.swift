//
//  GIPProfileViewCollectionViewCell.swift
//  Giphy
//
//  Created by Адель Ахметшин on 10.05.2023.
//

import UIKit
import SnapKit
import Kingfisher

class GIPProfileViewCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "GIPProfileViewCollectionViewCell"
    
    // MARK: - UI elements
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedView()
        setupBehavior()
        setupConstraints()
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Embed view
    private func embedView() {
        contentView.addSubviews(imageView)
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    // MARK: - Settings CALayer
    private func setUpLayer() {
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalToSuperview()
        }
    }
    
    /// Функция выполнять обновление при любом изменении коллекции
    /// - Parameter previousTraitCollection: UITraitCollection
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setUpLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Configure cells
    public func configure(_ url: String) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: url))
    }
}
