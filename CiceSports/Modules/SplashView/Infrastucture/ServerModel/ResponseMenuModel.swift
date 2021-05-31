//
//  ResponseMenuModel.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation

//MARK: - ResponseMenuModel
struct ResponseMenuModel: Codable {
    let menuResponse: [MenuResponse]?
    

    enum CodingKeys: String, CodingKey {
        case menuResponse = "menuResponse"
        
    }
}

// MARK: - MenuResponse
struct MenuResponse: Codable {
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let imagen: String?
    let literal: String?

    enum CodingKeys: String, CodingKey {
        case imagen = "imagen"
        case literal = "literal"
    }
}
