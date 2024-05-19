//
//  LoginBuilder.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

protocol LoginDependency{
    var authKit: AuthKit {get set}
}

class LoginComponent: Component<LoginDependency> {
    let authKit: AuthKit
    init(dependency: LoginDependency) {
        self.authKit = dependency.authKit
        super.init(with: dependency)
    }
}

protocol LoginBuildable {
    associatedtype Screen: View
    @ViewBuilder @MainActor func build() -> Screen
}

class LoginBuilder: LoginBuildable {
    private var component: LoginComponent
    init(component: LoginComponent) {
        self.component = component
    }
    @ViewBuilder @MainActor func build() -> some View {
        let LoginScreenModel: some LoginScreenModelProtocol = LoginScreenModel(authKit: component.authKit)
        LoginScreen(viewModel: LoginScreenModel, builder: self)
    }
}
