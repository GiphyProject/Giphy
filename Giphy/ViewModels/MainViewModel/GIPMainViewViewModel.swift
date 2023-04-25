//
//  GIPMainViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit

final class GIPMainViewViewModel: NSObject {
    override init() {}
}

extension GIPMainViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GIPMainViewCollectionViewCell.cellIdentifier, for: indexPath) as? GIPMainViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure()
        return cell
    }
}
