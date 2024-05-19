//
//  DetailScreenModel.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

@MainActor protocol DetailScreenModelProtocol {
    var number: Number {get set}
    func onAppear() async
    func onLogoutPressed()
}

@Observable @MainActor class DetailScreenModel: DetailScreenModelProtocol {
    var number: Number
    private let authKit: AuthKit
    init(number: Number, authKit: AuthKit) {
        self.number = number
        self.authKit = authKit
    }
    func onAppear() async {
        
    }
    func onLogoutPressed() {
        authKit.logout()
    }
}
