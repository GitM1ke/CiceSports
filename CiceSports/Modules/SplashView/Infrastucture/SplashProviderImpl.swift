//
//  SplashProviderImpl.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation
import Combine

protocol SplashProviderProtocol {
    func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, ApiError>) -> ())
}


class SplashProviderImpl: SplashProviderProtocol {
    
    //Ataco directo al protocolo
    let provider: RequestManagerProtocol = RequestManager() //No es un Singleton
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMenu(completionHandler: @escaping (Result<ResponseMenuModel, ApiError>) -> ())  {
        
        
        let request = RequestDTO(params: nil,
                                method: .get,
                                endpoint: URLEndpoint.baseUrl+URLEndpoint.endpointMenu)
        
        self.provider.requestGeneric(requestDto: request, entityclass: ResponseMenuModel.self)
            .sink { [weak self] (completion) in  // sink de una función en el fondo
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            } receiveValue: { [weak self] responseMenuModel in
                guard self != nil else { return }
                completionHandler(.success(responseMenuModel))
            }.store(in: &cancellable)
        
    }
    
}
// Cada Modulo debe tener su propio provider

