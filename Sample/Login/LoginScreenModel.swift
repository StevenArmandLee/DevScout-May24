//
//  LoginScreenModel.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

@MainActor protocol LoginScreenModelProtocol {
    func onAppear() async
    func onLoginPressed()
}

@Observable @MainActor class LoginScreenModel: LoginScreenModelProtocol {
    private let authKit: AuthKit
    
    init(authKit: AuthKit) {
        self.authKit = authKit
    }
    func onAppear() async {
        
    }
    
    func onLoginPressed() {
        authKit.login()
    }
}
