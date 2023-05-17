//
//  GIPDetailViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 03.05.2023.
//

import Foundation

final class GIPDetailViewViewModel: NSObject {
    private let profileModel: GIPProfileModel
    
    init(profileModel: GIPProfileModel) {
        self.profileModel = profileModel
    }
    
    func addToFavorites(_ gif: String) {
        let newGif = profileModel.favoriteGifs.value + [gif]
        profileModel.favoriteGifs.accept(newGif)
    }
}
