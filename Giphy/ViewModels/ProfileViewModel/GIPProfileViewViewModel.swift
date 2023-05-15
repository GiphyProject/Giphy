//
//  GIPProfileViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 04.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

final class GIPProfileViewViewModel: NSObject {
    private let disposeBag = DisposeBag()
    private let model: GIPProfileModel
    
    init(model: GIPProfileModel) {
        self.model = model
    }
    
    func cellBindingWithGifs(_ view: GIPProfileView) {
        print(model.observeGifs())
        model.observeGifs()
            .bind(to: view.collectionView.rx.items(
                cellIdentifier: GIPProfileViewCollectionViewCell.cellIdentifier,
                cellType: GIPProfileViewCollectionViewCell.self)) { row, element, cell in
                    cell.configure(element as! String) // FORCE UNWRAP
                }
    }
}
