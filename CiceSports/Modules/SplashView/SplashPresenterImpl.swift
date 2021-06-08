//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation


protocol SplashPresenterProtocol {
    func fetchDataFromHeroku()
    func showHomeTabBar()
}


class SplashPresenterImpl: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol> {
                                        // Conexión con la vista
    
    var interactor: SplashInteractorProtocol?
    var viewModel: [MenuResponse] = []
} // Este es el Property Wrapper de Apple.


extension SplashPresenterImpl: SplashPresenterProtocol {
    internal func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultArray in
            guard self != nil else { return }
            if let resultArraydDes = resultArray {
                self?.viewModel.removeAll()
                self?.viewModel = resultArraydDes
                self?.viewController?.fetchDataFromPresent()
            }
        }, failure: { (error) in
            print(error?.localizedDescription ?? "Aquí Andres mete gamba")
        })
    }
    
    internal func showHomeTabBar() {
        self.router?.showApp(dataMenu: self.viewModel)
    }
}

//Aqui estoy haciendo un Output a la vista

/*
 Una cosa es la clase y otra la extensión. Es recomendable hacerlo como está aquí.
 */
