//
//  MainBuilder.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

protocol MainDependency{
    var authKit: AuthKit {get set}
}

class MainComponent: Component<MainDependency>, DetailDependency, SpeakDependency {
    var authKit: AuthKit
    
    
    init(dependency: MainDependency) {
        self.authKit = dependency.authKit
        super.init(with: dependency)
    }
}

protocol MainBuildable {
    associatedtype Screen: View
    associatedtype Detail: View
    associatedtype Speech: View
    @ViewBuilder @MainActor func build() -> Screen
    @ViewBuilder @MainActor func buildDetail(for number: Number) -> Detail
    @ViewBuilder @MainActor func buildSpeech() -> Speech
}

class MainBuilder: MainBuildable {
    private var component: MainComponent
    private let detailComponent: DetailComponent
    init(component: MainComponent) {
        self.component = component
        self.detailComponent = DetailComponent(dependency: component)
    }
    @ViewBuilder @MainActor func build() -> some View {
        let MainScreenModel: some MainScreenModelProtocol = MainScreenModel()
        MainScreen(viewModel: MainScreenModel, builder: self)
    }
    @ViewBuilder @MainActor func buildDetail(for number: Number) -> some View {
        DetailBuilder(component: detailComponent).build(for: number)
    }
    @ViewBuilder @MainActor func buildSpeech() -> some View {
        SpeakBuilder(component: SpeakComponent(dependency: component)).build()
    }
}
