//
//  RootBuilder.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

class RootComponent: LoginDependency, MainDependency {
    var authKit: AuthKit
    init() {
        authKit = AuthKitImp()
    }
}

protocol RootBuildable {
    associatedtype Screen: View
    associatedtype LoginScreen: View
    associatedtype MainScreen: View
    @ViewBuilder @MainActor func build() -> Screen
    @ViewBuilder @MainActor func buildLogin() -> LoginScreen
    @ViewBuilder @MainActor func buildMain() -> MainScreen
}

class RootBuilder: RootBuildable {
    private var component: RootComponent
    private let loginComponent: LoginComponent
    private let mainComponent: MainComponent
    init(component: RootComponent) {
        self.component = component
        self.loginComponent = LoginComponent(dependency: component)
        self.mainComponent = MainComponent(dependency: component)
    }
    @ViewBuilder @MainActor func build() -> some View {
        let RootScreenModel: some RootScreenModelProtocol = RootScreenModel(authKit: component.authKit)
        RootScreen(viewModel: RootScreenModel, builder: self)
    }
    
    @ViewBuilder @MainActor func buildLogin() -> some View {
        LoginBuilder(component: loginComponent).build()
    }
    
    @ViewBuilder @MainActor func buildMain() -> some View {
        MainBuilder(component: mainComponent).build()
    }
}
