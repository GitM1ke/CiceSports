//
//  AppDelegate.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    let appAssembly: AppAssemblyProtocol = AppAssembly()
            // SUGAR -- tu protocolo es igual a mi assembly class. Eres de este tipo y te creas la clase.


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appAssembly.setPrincipalViewController(in: windowDes) // Con esto estás evitando que llegue un nulo.
                                                                  // Es una variable temporal y no ocupa espacio en memoria
        }
        
        return true
    }
}

/*
 
 - Solo debe esatr lo concerniente al ciclo de vida de la app
 - Meter chicha en el appdelegate no es buena práctica. Solo notificaciones psh y cosas así,. Nada más
 - Esto es un patrón Singleton:  Controla la carga perezosa de ciertos de datos en la aplicación en cierto momento.
 
 
 var window: UIWindow?
 let appAssembly: AppAssemblyProtocol = AppAssembly()


 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     window = UIWindow(frame: UIScreen.main.bounds)
     if let windowDes = window {
         appAssembly.setPrincipalViewController(in: windowDes)
     }
     
     return true
 }
 */
