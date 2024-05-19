//
//  DetailBuilder.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

protocol DetailDependency{
    var authKit: AuthKit {get set}
}

class DetailComponent: Component<DetailDependency> {
    
    init(dependency: DetailDependency) {
        super.init(with: dependency)
    }
}

protocol DetailBuildable {
    associatedtype Screen: View
    @ViewBuilder @MainActor func build(for number: Number) -> Screen
}

class DetailBuilder: DetailBuildable {
    private var component: DetailComponent
    init(component: DetailComponent) {
        self.component = component
    }
    @ViewBuilder @MainActor func build(for number: Number) -> some View {
        let DetailScreenModel: some DetailScreenModelProtocol = DetailScreenModel(number: number, authKit: component.dependency.authKit)
        DetailScreen(viewModel: DetailScreenModel, builder: self)
    }
}
