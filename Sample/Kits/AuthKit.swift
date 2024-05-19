//
//  AuthKit.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import Foundation
import Combine

protocol AuthKit {
    var isLoggedInPublisher: CurrentValueSubject<Bool, Never> { get }
    func login()
    func logout()
}

class AuthKitImp: AuthKit {
    let isLoggedInPublisher = CurrentValueSubject<Bool, Never>(false)
    
    func login() {
        isLoggedInPublisher.send(true)
    }
    
    func logout() {
        isLoggedInPublisher.send(false)
    }
}
