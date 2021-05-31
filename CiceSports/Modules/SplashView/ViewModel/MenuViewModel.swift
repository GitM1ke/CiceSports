//
//  MenuViewModel.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation

//MARK: - MenuViewModel
struct MenuViewModel {
    
    let menuResponse: [MenuResponse]?
    
    init(businessModel: ResponseMenuModel){
        self.menuResponse = businessModel.menuResponse
    }
}
