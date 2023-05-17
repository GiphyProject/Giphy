//
//  GIPProfileModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 12.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

final class GIPProfileModel: NSObject {
    var favoriteGifs = BehaviorRelay<[String]>(value: [])
    
    func observeGifs() -> Observable<[String]> {
        return favoriteGifs.asObservable()
    }
}
