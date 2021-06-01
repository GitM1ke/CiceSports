//
//  RequestManager.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityclass: T.Type) -> AnyPublisher<T, ApiError>
}


class RequestManager: RequestManagerProtocol {
    // función que se encargue de hacer una llamada.
    // evitar pods como Alamofire (deprecado ya)
    
    internal func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityclass: T.Type) -> AnyPublisher<T, ApiError>
    {
        
        let endpoint = requestDto.endpoint
        var urlRequest = URLRequest(url: URL(string: endpoint)!)
        let headers = AppAssembly.defaultHTTPHeaders
        // se crea cuando nace la app - appdelegate, appassembly
        
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        // Todo a partir del let headers puedo ponerlo en el requestDTO?

        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { (error) -> ApiError in
                ApiError.unknow
            }
            .flatMap { data, response -> AnyPublisher<T, ApiError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknow).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error in
                            ApiError.unknow
                        }
                        .eraseToAnyPublisher()
                } else {
                    let error = ApiError.unknow
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main) // Permite hacer llamada asincrona.
            .eraseToAnyPublisher()
    }
    
}
