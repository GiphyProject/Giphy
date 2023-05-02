//
//  GIPMainViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 25.04.2023.
//

import Foundation
import UIKit

final class GIPMainViewViewModel: NSObject {
    private var networkService: NetworkService = NetworkService()
    private let group = DispatchGroup()
    private var gifs = [String]()
    
    required override init() {
        super.init()
        getGifs()
        fetchData()
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
                        self.gifs.append(model.data[number].url)
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
    
    func fetchData() {
        group.notify(queue: .main) {
            // TODO: - продумать как заполнять коллекцию гифками
        }
    }
}
