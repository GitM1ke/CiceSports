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
 - Meter chicha en el appdelegate no es buena práctica. Solo notificaciones psh y cosas así,. Nada más
 */
