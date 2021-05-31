//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation


protocol SplashPresenterProtocol {
    func fetchDataFromHeroku()
}


class SplashPresenterImpl: BasePresenter<SplashViewController, SplashRouterProtocol> {
    
    var interactor: SplashInteractorProtocol?
    var viewModel: [MenuResponse] = []
}

extension SplashPresenterImpl: SplashPresenterProtocol {
    internal func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultArray in
            guard self != nil else { return }
            if let resultArraydDes = resultArray {
                self?.viewModel.removeAll()
                self?.viewModel = resultArraydDes
            }
        }, failure: { (error) in
            print(error?.localizedDescription ?? "Aquí Andres mete gamba")
        })
    }
}

/*
 Una cosa es la clase y otra la extensión. Es recomendable hacerlo como está aquí.
 */
