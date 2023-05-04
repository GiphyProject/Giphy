//
//  GIPMainViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class GIPMainViewViewModel: NSObject {
    
    private var networkService: NetworkService = NetworkService()
    private let disposeBag = DisposeBag()
    private let group = DispatchGroup()
    var gifs = [String]()
    
    required override init() {
        super.init()
        getGifs()
    }
    
    private func getGifs() {
        group.enter()
        networkService.getAnimations(completion: { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    // TODO: - изменить 0..< на константу
                    for number in 0..<10 {
                        //                        self.gifs.append(model.data[number].url)
                        self.gifs.append(model.data[number].images.fixedHeight.url)
                        
                    }
                    do {
                        self.group.leave()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func fetchData(_ view: GIPMainView) {
        group.notify(queue: .main) {
            // TODO: - Изменить логику из-за того, что при каждом запуске происходит загрузка данных из сети
            let selfGifs = Observable.of(self.gifs)
            selfGifs
                .bind(to: view.collectionView.rx.items(
                    cellIdentifier: GIPMainViewCollectionViewCell.cellIdentifier,
                    cellType: GIPMainViewCollectionViewCell.self)) { row, element, cell in
                        cell.configure(element as! String) // FORCE UNWRAP
                    }.disposed(by: self.disposeBag)
        }
    }
}
