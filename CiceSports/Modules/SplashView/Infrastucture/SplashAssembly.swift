//
//  SplashAssembly.swift  // Podia llamarse cordinator o mezcla de nombres
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation

// Microarquitectura VIPER

final public class SplashAssembly {
    // Métodos para poder leer desde cualquier otra vista la invocación de este módulo. Constructores y esencia de mi arquitectura.
    
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
        presenter.interactor = splashInteractor() //
            return presenter
    }
    
    // Si no inicializo la variable interactor no me va a retornar el objeto impl. Si no tengo estas lineas no puego gestionarlo independientemente. El interactor no dependa de un protocolo. Puedo ponerselo a cualquier vista, en cualquier parte. Puede llegar a ser reutilizable en otras partes.
    static func splashInteractor() -> SplashInteractorProtocol {
        let interactor = SplashInteractorImpl()
        return interactor
    }
    
    static func splashRouter(viewController: SplashViewController, presenter: SplashPresenterProtocol) -> SplashRouterProtocol {
        let router = SplashRouterImpl(presenter: presenter, view: viewController)
        return router
    }
}
