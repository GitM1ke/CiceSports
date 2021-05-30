//
//  ReuseIdentifier.swift
//  CiceSports
//
//  Created by M1keDev on 30/5/21.
//

import Foundation
import UIKit


public protocol ReuseIdentifierInterface: NSObject {
    static var defaultReuseIdentifier: String { get }
}

public extension ReuseIdentifierInterface where Self: UIView { //View
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}


public protocol ReuseIdentifierInterfaceViewController: NSObject {
        static var defaultReuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierInterfaceViewController where Self: UIViewController {  //Controller
    static var defaultReuseIdentifierViewController: String {
            return NSStringFromClass(self).components(separatedBy: ".").last!
        }
}


// Clase compuesta por protocolos
