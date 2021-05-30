//
//  SplashAssembly.swift  // Podia llamarse cordinator o mezcla de nombres
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation

// Microarquitectura VIPER

final public class SplashAssembly {
    // Métodos para poder leer desde cualquier otra vista la invocación de este módulo
    
    static func splashNavigationController() -> BaseNavigationController {
         let navigationController = BaseNavigationController(rootViewController: splashViewController())
        return navigationController
    }
    
    static func splashViewController() -> SplashViewController {
        let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = splashPresenter(viewController: vc)
        return vc
    }
    
    static func splashPresenter(viewController: SplashViewController) -> SplashPresenterProtocol {
        let presenter = SplashPresenterImpl(viewController: viewController) // ya he dicho que R puede ser nil por eso no lo incluyo.
        presenter.router = splashRouter(viewController: viewController, presenter: presenter)
            return presenter
    }
    
    static func splashRouter(viewController: SplashViewController, presenter: SplashPresenterProtocol) -> SplashRouterProtocol {
        let router = SplashRouterImpl(presenter: presenter, view: viewController)
        return router
    }
}
