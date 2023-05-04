//
//  GIPDetailViewViewModel.swift
//  Giphy
//
//  Created by Адель Ахметшин on 03.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

final class GIPDetailViewViewModel: NSObject {
    
    private let disposeBag = DisposeBag()
    private let gif: String?
    
    init(_ gif: String) {
        self.gif = gif
        super.init()
    }
}
