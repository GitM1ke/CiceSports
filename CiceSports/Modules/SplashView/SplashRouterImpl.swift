//
//  SplashRouterImpl.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation


protocol SplashRouterProtocol {
    func showApp(dataMenu: [MenuResponse])
}


class SplashRouterImpl: BaseRouter<SplashPresenterProtocol> {
    
}

extension SplashRouterImpl: SplashRouterProtocol {
    internal func showApp(dataMenu: [MenuResponse]){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let assembly = AppAssembly()
        let vc = HomeTabBarAssembly.homeTabBarController()
        assembly.createSlidingMenu(window: delegate.window!, vc: vc, menu: dataMenu)
    }
}
