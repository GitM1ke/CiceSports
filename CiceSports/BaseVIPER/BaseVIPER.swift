//
//  BaseVIPER.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation
import UIKit



class BaseViewController<P>: UIViewController {
    var presenter: P?
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//MARK: - BasePresenter

class BasePresenter<V, R> { //Vista y Router
    
    internal var viewController: V?
    internal var router: R?
    
    convenience init(viewController: V? = nil, router: R? = nil) { //el router lo puedo inicializar o no
        self.init()
        self.viewController = viewController
        self.router = router
    }
}



//MARK: - BaseRouter

class BaseRouter<P> {    // I - El Interactor puede ser un comodín o inyectarlo siempre.
                         // Cómo vamos a desplazarnos y navegar entre los distintos controladores.
    
    internal var presenter: P?
    internal var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    internal func showVC(_ vc: UIViewController){  //El show es de tipo PUSH
        if let navigationController = viewController?.navigationController {
                                                    //Lo que hace es mirar si hay algo o no.
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    internal func presentVC(_ vcToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil){
                                                                                            //
        if let navigationController = viewController?.navigationController {
            navigationController.present(vcToPresent, animated: flag, completion: completion)
        }
        viewController?.present(vcToPresent, animated: flag, completion: completion)
    }
}


//MARK: -BaseNavigationController

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



//MARK: - BaseInteractor (BusinessModel)

class BaseInteractor<P> {
    
    internal var presenter: P?
    
    convenience init(presenter: P) {
        self.init()
        self.presenter = presenter
    }
}


/*
VIPER - Todo esto debería estar incluido en un controlador de vista -  Esta es la MICROARQUITECTURA

- View - Splash
- Presenter - Le informará a la vista todo lo que requiera, solo interactua con lo que la vista le pide - PropertyWrapper (MVVM - Swift)
- Interactor (BusinessLogic) - Sacarle mucha responsabilidad al presenter
- Entity (ServerModel / BusinessModel / ViewModel)
        /Modelo de datos en crudo proveniente del Provider
                    /Aquí se gestiona y lo mapeas alo que requieras
                                    /Es lo que la vista pintará
- Provider (NetworkService)
- Coordinator (Assembly) - Ensambla todas las piezas.
 
 
 . Todas estas clases son Injecciones de dependencias.
 
 . Cada vez que aparezca un "viewDid..." es que hay un delegado x detrás.
 
 . Como se identifica un patrón Singleton en iOS: por la palabra Shared, Default y....
   Controla la carga perezosa de ciertos de datos en la aplicación en cierto momento.
   Con la creación de protocolos no es necesario.
   Es respetable pero no es la mejor de las prácticas.
   Revisar en MEDIUM los 5 patrones más importantes.
 . Todo esto es la base del StoryBoard
*/
