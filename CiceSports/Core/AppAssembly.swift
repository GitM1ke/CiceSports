//
//  AppAssembly.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol {
    func setPrincipalViewController(in window: UIWindow) // Presentación de manera pública a través del protocolo.
}

class AppAssembly: AppAssemblyProtocol {  //Aquí vamos a personalizar toda la interfaz y el appdelegate quedará limpio
    
    var actualViewController: UIViewController!
    
    internal func setPrincipalViewController(in window: UIWindow) {  //internal lo hace super privado
        actualViewController = SplashAssembly.splashNavigationController() //Puedo quitarle el navigation y solo usar splash...
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
        
         
    }
}

/*
 - Puedo acceder am i clase privada cuando me suscriba a través de un protocolo.
 - Aquí nos hemos creado un controlador de vista y lo hemos hecho visible.
 */
 
