//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation


protocol SplashPresenterProtocol {
    func fetchDataFromItunes()
}


class SplashPresenterImpl: BasePresenter<SplashViewController, SplashRouterProtocol> {
    
}

extension SplashPresenterImpl: SplashPresenterProtocol {
    internal func fetchDataFromItunes() {
        self.router?.goToDetailVC()
    }
}

/*
 Una cosa es la clase y otra la extensión. Es recomendable hacerlo como está aquí.
 */
