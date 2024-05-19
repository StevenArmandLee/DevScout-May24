//
//  RootScreenModel.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI
import Combine
import Observation

@MainActor protocol RootScreenModelProtocol {
    func onAppear() async
    var isLoggedIn: Bool { get set }
}

@Observable @MainActor class RootScreenModel: RootScreenModelProtocol {
    private let authKit: AuthKit
    var isLoggedIn: Bool = false
    var subscribers = Set<AnyCancellable>()
    
    init(authKit: AuthKit) {
        self.authKit = authKit
        self.isLoggedIn = false
    }
    
    func onAppear() async {
        isLoggedIn = authKit.isLoggedInPublisher.value
        startListening()
    }
    
    private func startListening() {
        authKit.isLoggedInPublisher
            .assign(to: \.isLoggedIn, on: self).store(in: &subscribers)
    }
}


extension Publisher where Failure == Never {
    func assign<Root: AnyObject>(to keyPath: ReferenceWritableKeyPath<Root, Output>, on root: Root) -> AnyCancellable {
       sink { [weak root] in
            root?[keyPath: keyPath] = $0
        }
    }
}
