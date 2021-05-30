//
//  SplashRouterImpl.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation


protocol SplashRouterProtocol {
    func goToDetailVC()
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
    
}

extension SplashRouterImpl: SplashRouterProtocol {
    internal func goToDetailVC(){
        //
    }
}
