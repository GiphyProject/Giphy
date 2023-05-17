//
//  GIPProfileView.swift
//  Giphy
//
//  Created by Адель Ахметшин on 04.05.2023.
//

import UIKit
import SnapKit

final class GIPProfileView: UIView {
    
    // MARK: - UI elements
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedView()
        setupConstraints()
        setupBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Settings
    private func embedView() {
        addSubviews(collectionView)
    }
    
    // MARK: - Setup behavior
    private func setupBehavior() {
        backgroundColor = .green
        collectionView.collectionViewLayout = createCompositionLayout()
        collectionView.register(
            GIPProfileViewCollectionViewCell.self,
            forCellWithReuseIdentifier: GIPProfileViewCollectionViewCell.cellIdentifier
        )
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Create composition layout
    private func createCompositionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            return self.createSection()
        }
    }
    
    private func createSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(250)),
                                                       subitem: item,
                                                       count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.pinToVisibleBounds = false
        sectionHeader.zIndex = Int.max
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}
