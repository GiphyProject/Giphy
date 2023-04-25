//
//  GIPMainViewCollectionViewCell.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import UIKit
import SnapKit

final class GIPMainViewCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "MainViewCollectionViewCell"
    
    // MARK: - UI elements
    private let imageView: UIImageView = {
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
        contentView.backgroundColor = .blue
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
            make.height.equalTo(130)
            make.width.equalTo(160)
            
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
    public func configure() {
        
    }
}
