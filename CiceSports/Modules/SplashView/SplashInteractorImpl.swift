//
//  SplashInteractorImpl.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation


protocol SplashInteractorProtocol {
    func fetchDataFromHerokuBusiness (success: @escaping([MenuResponse]?) ->(), failure: @escaping(ApiError?) ->())
}

class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol>{
    var provider: SplashProviderProtocol = SplashProviderImpl()
}

extension SplashInteractorImpl: SplashInteractorProtocol {
    // El resto de funcionalidades de la clase
    
    internal func fetchDataFromHerokuBusiness (success: @escaping([MenuResponse]?) ->(), failure: @escaping(ApiError?) ->()) {
        self.provider.fetchMenu{[weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                success(response.menuResponse)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
