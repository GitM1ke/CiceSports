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
    public typealias HTTPheaders = [String: String]
    
    
    internal func setPrincipalViewController(in window: UIWindow) {  //internal lo hace super privado
        
        self.customUI()
        actualViewController = SplashAssembly.splashViewController() //Puedo quitarle el navigation y solo usar splash...
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
    
    internal func createSlidingMenu(window: UIWindow, vc: UIViewController, menu: [MenuResponse]) {
        self.customUI()
        let fromViewController = vc
        let rearViewController = MenuViewController()
        rearViewController.aux = menu
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: fromViewController) //Esto es lo que nos permite el Bridge Header, acceder a un objeto que está en Objective_C
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
    
    fileprivate func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        //let toolBar = UIToolbar.appearance()
        
        navBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navBar.barStyle = .black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    public static let defaultHTTPHeaders: HTTPheaders = {
        let BearerAuthentication = AutheHeroku.authHeroku
        return [
            "Authorization": BearerAuthentication
        ]
    }()
}

/*
 - Puedo acceder am i clase privada cuando me suscriba a través de un protocolo.
 - Aquí nos hemos creado un controlador de vista y lo hemos hecho visible.
 */
 
