//
//  SplashViewController.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import UIKit


class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierInterfaceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromHeroku()

        // Do any additional setup after loading the view.
    }

    
    
    
    
    /*
     Creado un proyecto.
     Iniciamos git
     Hemos salvado en local, ls -la
     */

}
