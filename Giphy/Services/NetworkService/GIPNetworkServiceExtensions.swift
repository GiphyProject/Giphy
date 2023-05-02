//
//  GIPNetworkServiceExtensions.swift
//  Giphy
//
//  Created by Адель Ахметшин on 02.05.2023.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
}

enum NetworkError: Error {
    case failedToGetData
}
