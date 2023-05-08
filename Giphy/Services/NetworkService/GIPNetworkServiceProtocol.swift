//
//  GIPNetworkServiceProtocol.swift
//  Giphy
//
//  Created by Адель Ахметшин on 02.05.2023.
//

import Foundation

protocol GIPNetworkServiceProtocol: AnyObject {
    func getAnimations(completion: @escaping (Result<GIPMainModel, Error>) -> Void)
    func createRequest(with url: URL?, type: HttpMethod, completion: @escaping (URLRequest) -> Void)
}
