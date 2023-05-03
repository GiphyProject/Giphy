//
//  NetworkService.swift
//  Giphy
//
//  Created by Адель Ахметшин on 02.05.2023.
//

import Foundation

final class NetworkService: GIPNetworkServiceProtocol {
    
    func getAnimations(completion: @escaping (Result<GIPMainModel, Error>) -> Void) {
        createRequest(with: URL(string: Str.baseAPIRUL + Str.apiKey + Str.limit + Str.requestNumber), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkError.failedToGetData))
                    return
                }
                do {
                    let gifs = try JSONDecoder().decode(GIPMainModel.self, from: data)
                    completion(.success(gifs))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    func createRequest(with url: URL?, type: HttpMethod, completion: @escaping (URLRequest) -> Void) {
        guard let apiURL = url else {
            return
        }
        var request = URLRequest(url: apiURL)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        completion(request)
    }
}
