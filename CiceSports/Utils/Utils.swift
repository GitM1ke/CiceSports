//
//  Utils.swift
//  CiceSports
//
//  Created by M1keDev on 31/5/21.
//

import Foundation

// Gestión de errores
enum ApiError: Error, LocalizedError {
    case unknow, apiError(reason: String)
    var errorDescription: String? {
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}


// Define que tipo de método voy a ejecutar en la llamada
enum HTTPMethods: String {
    
    case get = "GET"
    case post = "POST"
}
//Enum -Técnica para definir casos dde uso


struct RequestDTO {
    
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: Any]?, method: HTTPMethods, endpoint: String) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: Any]], method: HTTPMethods, endpoint: String) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEndpoint {
    
    static let baseUrl =  "https://app-cicesports.herokuapp.com/"
    
    static let endpointMenu = "iCoMenu"
}


