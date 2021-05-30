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
class BasePresenter<V, R> {
    
}

//MARK: - BaseRouter
class BaseRouter<V, P> { //El Interactor puede ser un comodín o inyectarlo siempre.
    
}

//MARK: - BaseInteractor
class BaseInteractor<P> {
    
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
 
 
 Todas estas clases son Injección de dependencias.
 
 Cada vez que aparezca un "viewDid..." es que hay un delegado x detrás.
 
 Como se identifica un patrón Singleton en iOS: por la palabra Shared, Default y....
  Controla la carga perezosa de ciertos de datos en la aplicación en cierto momento.
  Con la creación de protocolos no es necesario.
  Es respetable pero no es la mejor de las prácticas.
  Revisar en MEDIUM los 5 patrones más importantes.
*/
